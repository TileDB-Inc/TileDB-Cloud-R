# Node is an R reference class. We need references since we have a mutable DAG of nodes
# and we must be able to update them as their computation progresses.
#
# See the delayed() function in this package for a factory function. This constructor
# is not intended to be invokved directly, but rather, by delayed().

# ----------------------------------------------------------------
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
    has_result    = FALSE, # in case retval is legit NULL; also for failure handling

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
      dag <- DAG$new(namespace=namespace, terminal_node=self)
    },

    # ----------------------------------------------------------------
    # This is for reruns in case of transient node failures.
    reset = function() {
      if (self$status == FAILED) {
        self$status        <- NOT_STARTED
        self$future        <- NULL
        self$future_result <- NULL
        self$result        <- NULL
        self$has_result    <- FALSE
      }
    },

    # ----------------------------------------------------------------
    # This launches a compute of the entire DAG which *terminates* at this item.
    # This is not a solely-self-compute method to run on this particular item's
    # delayed function.
    #
    # NULL timeout_seconds means wait indefinitely.
    compute = function(namespace, timeout_seconds=NULL, verbose=FALSE) {
      dag <- self$make_dag(namespace)
      dag$compute(timeout_seconds=timeout_seconds, verbose=verbose)
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

      if (self$has_result) {
        self$status <- COMPLETED
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

          self$result <- result(self$future)$value
          self$status <- COMPLETED

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
            if (!arg$has_result) {
              stop("internal coding error: args results should have already been awaited")
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
        earlySignal=TRUE)

      self$status <- RUNNING
      return(FALSE)
    },

    # ----------------------------------------------------------------
    # This is used for DAG construction.
    is_initial = function() {
      if (!self$have_args) {
        stop("delayed object must have args set before calling compute")
      }
      length(self$args) == 0
    },

    # ----------------------------------------------------------------
    args_ready = function() {
      for (arg in self$args) {
        if (is(arg, "Node")) {
          if (!arg$has_result) {
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
    }
  )
)

# ----------------------------------------------------------------
# Let people do 'compute(f)' in addition to 'f$compute()'
##' @family {manual-layer functions}
##' @export
compute <- function(object, namespace, timeout_seconds=NULL, verbose=FALSE) 0
setMethod("compute", signature(object = "Node"), function(object, namespace, timeout_seconds=NULL, verbose=FALSE) {
  object$compute(namespace=namespace, timeout_seconds=timeout_seconds, verbose=verbose)
})
##' @family {manual-layer functions}
##' @export
compute_sequentially <- function(object) 0
setMethod("compute_sequentially", signature(object = "Node"), function(object) {
  object$compute_sequentially()
})

# ----------------------------------------------------------------
setMethod("show", signature(object = "Node"), function(object) {
  object$show()
})
