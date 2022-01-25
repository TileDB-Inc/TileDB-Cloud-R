# ================================================================
# Node is an R reference class. We need references since we have a mutable DAG of nodes and we must
# be able to update them as their computation progresses.
#
# See the delayed() function in this package for a factory function. This constructor is not
# intended to be invoked directly, but rather, by delayed().
# ================================================================

# ================================================================
# Notes on debug:
#
# * The 'future' package's default behavior is zero parallelism -- hence we need an explicit
#   future::plan.
#
# * Future's 'plan::multicore' is more or less like Python's ProcessPoolExecutor. There exists no
#   analog of ThreadPoolExecutor for R, and my understanding is there never will be -- too many
#   issues with threads and R.
#
# * Processes:
#
#   o Say you have a 2-node DAG where node B depends on node A.
#
#   o There is an R process for the call to compute(B). Inside that is dag$poll() which invokes
#     node$poll() for both the A and B nodes.
#
#   o There will be a forked R process for the call to A's future
#
#   o There will be a forked R process for the call to B's future
#
#   o Both of those forked R processes, in turn, are just sitting in a synchronous call to the REST
#     server to execute the UDF/SQL/etc. So, in any non-trivial DAG, the parent/polling process
#     spends most of its time awaiting futures which are running in the child/forked processes, and
#     those are in turn spending most of their time awaiting the results of HTTP requests to the
#     REST server.
#
#   o Those futures resolve into the parent process' called to resolved().  The _only_ communication
#     between child processes and the parent process is via (a) the return value from the future,
#     and stdout prints by the child. Crucially, prints to stderr are completely lost, and prints to
#     stdout do _not_ go directly to stdout -- they only are obtainable once the future is
#     _resolved_ and the parent process gets all the child process' stdout lines all at one go via
#     `self$future_result$stdout)`.
#
# * Debugging:
#
#   o If you are doing light debug, just have R print/cat/etc within the node functions -- their
#     stdout will appear once the future completes.
#
#   o If you are doing hard debug, and if you need info on child processes which are still running
#     -- I've used R's `broswer` to debug the parent process, but I don't know how to make that to
#     work to debug child processes.  The best experience I can suggest is doing write-to-disk-file
#     within the child process and then tail that disk file from a separate terminal.
#
# * DAG invocation: More detail in the vignettes, but the essentials are:
#    o a <- delayed(function()  {   9  },                 display_name='a')
#    o b <- delayed(function(x) { 10*x }, args=list(a),   display_name='b')
#    o Simplest:
#      o <- compute(a), namespace='namespace_to_charge')
#      show(o$dag_for_terminal)
#      str(o$dag_for_terminal)
#      o <- compute(a), namespace='namespace_to_charge') # retry failed nodes
#    o More detail:
#      o <- compute(a), namespace='namespace_to_charge', verbose=TRUE)
# ================================================================

# ----------------------------------------------------------------
# Users can name their nodes with display-names if they like. Absent that, the following is used
# for display names, and regardless, is always used for hash-mapping node IDs to node objects.
make_id_generator <- function() {
    count <- 0
    f <- function() {
        count <<- count + 1
        return(sprintf("n%06d", count))
    }
    return(f)
}
id_generator <-make_id_generator()
# ----------------------------------------------------------------

##' @export
##' @importFrom future future
Node <- R6::R6Class(
  'Node',
  public = list(
    func          = NULL,
    args          = NULL,
    # have_args is necessary in addition to args (with check args being non-null)
    # since some functions have no arguments and it's pedantic (bad UX) for us to
    # insist that people separately articulate that. See the 'delayed' factory
    # function.
    have_args     = NULL,
    do_local      = NULL,

    future        = NULL,
    future_result = NULL,
    status        = NULL,
    result        = NULL,

    # Only the terminal node in the DAG has this being non-null
    dag_for_terminal = NULL,

    id            = NULL,
    display_name  = NULL,

    # Note: args are non-optional here but user-convenience optionals are
    # implemented in the 'delayed' factory function.
    initialize = function(func, args, have_args, display_name, do_local) {
      self$result       <- NULL
      self$func         <- func
      self$args         <- args
      self$have_args    <- have_args
      self$future       <- NULL
      self$status       <- NOT_STARTED
      self$result       <- NULL

      self$id <- id_generator()
      if (is.null(display_name)) {
        self$display_name <- self$id
      } else {
        self$display_name <- display_name
      }
      self$do_local     <- do_local
    },

    set_args = function(value) {
      stopifnot(is.list(value))
      self$args <- value
      self$have_args <- TRUE
    },

    # ----------------------------------------------------------------
    # This was written first during package development, and is also perhaps
    # useful for debug. Or if anyone is ever deeply refactoring / taking apart
    # and reassembling this stuff.
    compute_sequentially = function() {
      if (!is.null(self$result)) {
        return (self$result)
      }
      if (!self$have_args) {
        stop("delayed object must have args set before calling compute")
      }
      evaluated <- lapply(self$args, function(arg) {
        if (is(arg, "Node")) {
          arg$compute_sequentially()
        } else {
          arg
        }
      })
      # Memoize for the benefit of any other nodes that depend on this one
      self$result <- do.call(self$func, evaluated)
      self$result
    },

    # ----------------------------------------------------------------
    # Nominal use-case is people call compute(...) on a return value from delayed(...).
    # However, for more detailed inspection we support getting a DAG and doing dag$poll()
    # and inspecting the results as computation progresses.
    make_dag = function(namespace) {
      self$dag_for_terminal <- DAG$new(namespace=namespace, terminal_node=self)
      self$dag_for_terminal
    },

    # ----------------------------------------------------------------
    # This is for reruns in case of transient node failures.
    reset = function() {
      if (self$status == FAILED) {
        self$status        <- NOT_STARTED
        self$future        <- NULL
        self$future_result <- NULL
        self$result        <- NULL
      }
    },

    # ----------------------------------------------------------------
    # This launches a compute of the entire DAG which *terminates* at this item.
    # This is not a solely-self-compute method to run on this particular item's
    # delayed function.
    #
    # NULL timeout_seconds means wait indefinitely.
    compute = function(namespace, timeout_seconds=NULL, verbose=FALSE) {
      # Store this inside the terminal node so that after a compute() (whether
      # successful or failed) people can show(n$dag_for_terminal) to visualize
      # future results, stdout from the forked processes, etc.
      if (is.null(self$dag_for_terminal)) {
        self$make_dag(namespace)
      }

      self$dag_for_terminal$compute(timeout_seconds=timeout_seconds, verbose=verbose)
    },

    # ----------------------------------------------------------------
    # IMPORTANT: even though we're using reference classes, the stuff inside the
    # future body is executed in a *separated forked process*. So a given node
    # can't just walk the args-DAG to see if its callers are done. Crucially, the
    # interaction between the forked process and the parent is the future's
    # return value.
    #
    # Our DAG is a poll-driven DAG so dag$poll() must be called repeatedly
    # in order to launch futures for initial nodes, detect when they are resolved,
    # launch subsequent nodes, etc.
    poll = function(namespace, verbose=FALSE) {
      if (is.null(namespace)) {
        stop("namespace must be non-null")
      }
      if (namespace=="") {
        stop("namespace must be non-empty")
      }

      if (self$status == COMPLETED) {
        return(TRUE)
      }

      if (!self$have_args) {
        stop("delayed object must have args set before calling compute")
      }
      for (arg in self$args) {
        if (is(arg, "Node")) {
          arg$poll(namespace=namespace, verbose=verbose)
        }
      }
      if (!self$args_ready()) {
        return(FALSE)
      }

      # Check if already running.  This protects against multiple launches in
      # diamond-dependency cases.
      if (!is.null(self$future)) {
        if (resolved(self$future)) {

          # Save this off for show()/str() later
          self$future_result <- result(self$future)

          if (verbose) {
            # These are output lines from within the forked process. We get them
            # all at once, so it's extra-important that they had been printed
            # with timestamps within them.
            cat(self$future_result$stdout)
            t <- Sys.time()
            cat(as.integer(t), as.character(t), "END  ", self$display_name, "\n")
          }

          if (!is.null(result(self$future)$visible) && result(self$future)$visible) {
            self$result <- result(self$future)$value
            self$status <- COMPLETED
          } else {
            self$status <- FAILED
            stop("node failed: ", self$display_name, ": ",
              paste(sapply(result(self$future)$conditions, function(c) {c$condition$message}), collapse=";"))
          }

          # Empty this out so dependent nodes have less data to serialize
          self$future <- NULL

          return(TRUE)
        }
        return(FALSE)
      }

      if (verbose) {
        t <- Sys.time()
        cat(as.integer(t), as.character(t), "START", self$display_name, "\n")
      }

      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # As noted above, everything inside the curly braces here executes within a
      # separate forked process. All args are snapshotted as of the fork. Any
      # updates to self between the curly braces won't persist after the forked
      # process has executed.  Communication back to the parent process is via
      # the return value from the stuff between the curly braces.
      self$future <- future::future(
        {
        # TODO: make helper method
        evaluated <- lapply(self$args, function(arg) {
          if (is(arg, "Node")) {
            if (arg$status == FAILED) {
              stop("dependency has failed")
            }
            if (arg$status != COMPLETED) {
              stop("internal coding error: detected at node ", self$display_name,
                " result for arg ", arg$display_name, " should have already been awaited")
            }
            arg$result
          } else {
            arg
          }
        })

        # These cat lines to stdout won't go anywhere visible as they're inside
        # the forked process -- only when the parent collects result via
        # 'cat(self$future_result$stdout)' will they be user-visible. For this reason it's
        # extra-important that we provide timestamps.
        if (self$do_local) {
          t <- Sys.time()
          cat(as.integer(t), as.character(t), "launch local compute  ", self$display_name, "\n")
          self$result <- do.call(self$func, evaluated)
          t <- Sys.time()
          cat(as.integer(t), as.character(t), "finish local compute  ", self$display_name, "\n")
        } else {
          t <- Sys.time()
          cat(as.integer(t), as.character(t), "launch remote compute  ", self$display_name, "\n")
          self$result <- execute_generic_udf(namespace=namespace, udf=self$func, args=evaluated)
          t <- Sys.time()
          cat(as.integer(t), as.character(t), "finish remote compute  ", self$display_name, "\n")
        }
        # This return value back to the call
        self$result
        },
        earlySignal=FALSE)
        # If earlySignal == TRUE, resolved(self$future) will throw before returning.
        # With earlySignal == FALSE, we have to do more bookkeeping ourselves but it's
        # easier to set the node status to FAILED.

      self$status <- RUNNING
      return(FALSE)
    },

    # ----------------------------------------------------------------
    # This is used for DAG construction.
    is_initial = function() {
      if (!self$have_args) {
        stop("delayed object must have args set before calling compute")
      }
      for (arg in self$args) {
        if (is(arg, "Node")) {
          return(FALSE)
        }
      }
      return(TRUE)
    },

    # ----------------------------------------------------------------
    args_ready = function() {
      for (arg in self$args) {
        if (is(arg, "Node")) {
          if (arg$status == FAILED) {
            stop("dependency has failed")
          }
          if (arg$status != COMPLETED) {
            return(FALSE)
          }
        }
      }
      return(TRUE)
    },

    # ----------------------------------------------------------------
    # This is a helper function for topological sort. Finding all the args
    # of a node is easy: node$args. This goes the other way around.
    #
    # Example:
    # * a is initial
    # * b and c both have a as arg
    # * d has b and c as args.
    # We want b$is_arg_of(d) to return TRUE.
    is_arg_of = function(other) {
      for (arg in other$args) {
        if (is(arg, "Node")) {
          if (arg$id == self$id) {
            return(TRUE)
          }
        }
      }
      return(FALSE)
    },

    # ----------------------------------------------------------------
    # For DAG display
    show_status = function() {
      cat("  ", self$display_name, " ", sep="")
      cat(" args_ready=", ifelse(self$have_args, self$args_ready(), "(none set)"), sep="")
      cat(" status=", self$status, sep="")
      cat("\n")
    },

    show = function() {
      cat("node=", self$display_name, sep="")
      cat(",nargs=", ifelse(self$have_args, length(self$args), "(none set)"), sep="")
      cat(",args_ready=", ifelse(self$have_args, self$args_ready(), "(none set)"), sep="")
      cat(",future=", ifelse(is.null(self$future), "absent", "present"), sep="")
      cat(",status=", self$status, sep="")
      cat(",result=", ifelse(is.null(self$result), "(null)", self$result), sep="")
      cat("\n")
      if (!is.null(self$dag_for_terminal)) {
        show(self$dag_for_terminal)
      }
    }
  )
)

# ----------------------------------------------------------------
# This generic lets people do 'compute(f)' in addition to 'f$compute()'

##' Launch a task graph from a given terminal node in the task graph
##'
##' The task graph is implicitly defined by various \code{delayed} objects having others
##' in their argument lists.
##'
##' @family {manual-layer functions}
##' @export
compute <- function(object, namespace, timeout_seconds=NULL, verbose=FALSE) 0
setMethod("compute", signature(object = "Node"), function(object, namespace, timeout_seconds=NULL, verbose=FALSE) {
  object$compute(namespace=namespace, timeout_seconds=timeout_seconds, verbose=verbose)
})

# Test/debug entrypoint
compute_sequentially <- function(object) 0
setMethod("compute_sequentially", signature(object = "Node"), function(object) {
  object$compute_sequentially()
})

# ----------------------------------------------------------------
setMethod("show", signature(object = "Node"), function(object) {
  object$show()
})
