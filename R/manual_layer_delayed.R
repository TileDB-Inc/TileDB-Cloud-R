# TODO:
# * rox-style docblocks
# * description:imports

# ================================================================
##' delayed is an exported factory function for the "Delayed" implementation class.
##'
##' Intentionally, Delayed has non-public consructor, but a few public accessors.
##'
##' @family {manual-layer functions}
##' @export
delayed <- function(func, args=NULL, display_name=NULL) {
  have_args <- FALSE

  if (is.null(args)) {
    # Function args were not passed here in the factory function. They'll need
    # to set args later. Unless the function takes no args in which it's
    # pedantic of us to insist on that.
    args <- list()
    if (length(formals(func)) == 0) {
      have_args <- TRUE
    }
  } else {
    # Function args were passed here in the factory function. They need
    # to be a list, like 'delayed(f, list(3,4))' not 'delayed(f, 3, 4)'.
    # TODO: find a way to accept the latter ...
    stopifnot(is.list(args))
    have_args <- TRUE
  }
  # TODO
  namespace <- as.character(floor(runif(1, min = 100000, max = 999999)))

  # TODO: find the correct reference-class syntax to let this be nullable.
  # Every node in the DAG needs to have a DAG reference but *only* once the
  # entire DAG is set up. Before then, the node$dag slot should really be NULL.
  dag <- new("DAG", namespace=namespace)

  retval <- new("Delayed", func=func, args=args, have_args=have_args, dag=dag, display_name=display_name)
  retval$node <- new("Node", payload=retval, display_name=display_name)
  retval$update_node_parents_from_args()

  retval
}

# ================================================================
delayedGenerator <- setRefClass("Delayed", representation(
  func         = "function",
  args         = "list",
  have_args    = "logical",
  # WTF
  # node       = "Node",
  node         = "ANY",
  dag          = "DAG",
  # Ditto
  # thefuture       = "Future",
  thefuture       = "ANY",
  # TODO: probably need separate have_result in case legit retval is a NULL.
  # TODO: maybe resolved(.self$thefuture) is enough.
  result       = "ANY",
  debug        = "character",
  #display_name = "character"
  # TODO: find out how to make this character OR null ...
  display_name = "ANY"
))

delayedGenerator$methods(
  initialize = function(.self, func, args, have_args, node=NULL, dag, display_name) {
    .self$result       <- NULL
    .self$func         <- func
    .self$args         <- args
    .self$have_args    <- have_args
    .self$node         <- node
    .self$dag          <- dag
    .self$thefuture    <- NULL
    .self$result       <- NULL
    .self$debug        <- "INIT"
    .self$display_name <- display_name
  },

  set_args = function(.self, value) {
    stopifnot(is.list(value))
    .self$args <- value
    .self$have_args <- TRUE
    .self$update_node_parents_from_args()
  },

  # Delayed functions have args; nodes have parent nodes.
  # This is division of labor and also duplication of effort; so be it.
  # Here we synchronize one to the other
  update_node_parents_from_args = function(.self) {
    for (arg in .self$args) {
      if (is(arg, "Delayed")) {
        if (is.null(.self$node)) {
          stop("internal coding error: delayed$node should have been initialized")
        }
        if (is.null(arg$node)) {
          stop("internal coding error: delayed$node should have been initialized")
        }
        .self$node$add_parent(arg$node)
      }
    }
  },

  # ----------------------------------------------------------------
  # This was written first during package dev, and is also perhaps useful for
  # debug. Or if anyone is ever deeply refactoring / taking apart and
  # reassembling this stuff.
  #
  # TODO: rename
  compute_sequentially = function(.self) {
    if (!is.null(.self$result)) {
      return (.self$result)
    }
    if (!.self$have_args) {
      stop("delayed object must have args set before calling compute")
    }
    evaluated <- lapply(.self$args, function(arg) {
      if (is(arg, "Delayed")) {
        arg$compute_sequentially()
      } else {
        arg
      }
    })
    .self$result <- do.call(.self$func, evaluated)
    .self$result
  },

  # ----------------------------------------------------------------
  # This launches a compute of the entire DAG which *terminates* at this item.
  # This isn't a self-compute method to run on this particular item's delayed
  # function.
  compute = function(.self) {
    # TODO: namespace
    dag <- new("DAG", namespace="temp namespace", terminal_node=.self$node)

    # TODO:
    dag$compute()
  },

  # ----------------------------------------------------------------
  launch_compute = function(.self) {
    .self$debug <- paste0(.self$debug, ",lc")
    launch_compute_non_method(.self)
  }
)

# TODO: comment this seems to need to be outside the reference class ...
launch_compute_non_method <- function(self) {
  self$debug <- paste0(self$debug, ",lcnm")
  # TODO: check if already running
  # TODO: note this protects against multiple launches in diamond (multiple-child) cases.
  if (!is.null(self$thefuture)) {
    self$debug <- paste0(self$debug, ",eret")
    return()
  }
  cat("LAUNCH", self$display_name, "\n")

  self$thefuture <- future::future({self$compute_within_future()})

  for (arg in self$args) {
    if (is(arg, "Delayed")) {
      arg$launch_compute()
    }
  }

  # TODO: WAITING
  self$node$status <- RUNNING
  self$debug <- paste0(self$debug, ",launched")
}

delayedGenerator$methods(
  compute_within_future = function(.self) {
    .self$debug <- paste0(.self$debug, ",cwf:enter")
    if (!is.null(.self$result)) {
      .self$debug <- paste0(.self$debug, ",cwf:eret")
      .self$node$status <- COMPLETED
      return (.self$result)
    }
    if (!.self$have_args) {
      stop("delayed object must have args set before calling compute")
    }

    while (!.self$args_ready()) {
      .self$debug <- paste0(.self$debug, ",S")
      Sys.sleep(0.5)
    }

    evaluated <- lapply(.self$args, function(arg) {
      if (is(arg, "Delayed")) {
        if (!arg$has_result()) {
           stop("internal coding error: args results should have already been awaited")
        }
        arg$result
      } else {
        arg
      }
    })

    .self$debug <- paste0(.self$debug, ",ci")
    .self$result <- do.call(.self$func, evaluated)
    .self$debug <- paste0(.self$debug, ",co")
    .self$result
  },

  is_compute_finished = function(.self) {
    .self$debug <- paste0(.self$debug, ",icf:e")
    if (is.null(.self$thefuture)) {
      stop("internal coding error: awaiting resolve of unlaunched future.")
    }
    if (resolved(.self$thefuture)) {
      .self$debug <- paste0(.self$debug, ",icf:rt")
      .self$result <- result(.self$thefuture)$value
      .self$node$status <- COMPLETED
      TRUE
    } else {
      .self$debug <- paste0(.self$debug, ",icf:rf")
      FALSE
    }
  },

  args_ready = function(.self) {
    for (arg in .self$args) {
      if (is(arg, "Delayed")) {
        if (!arg$has_result()) {
          return(FALSE)
        }
      }
    }
    return(TRUE)
  },

  has_result = function(.self) {
    !is.null(.self$result)
  },

  # ----------------------------------------------------------------
  show_deps = function(.self, prefix="") {
    cat(prefix)
    .self$show()
    for (arg in .self$args) {
      if (is(arg, "Delayed")) {
        arg$show_deps(paste0(prefix, "  "))
      }
    }
  },

  str = function(.self) {
    utils::str(.self, max.level=5)
  },

  show = function(.self) {
    cat("node=", .self$display_name, sep="")
    cat(",nargs=", ifelse(.self$have_args, length(.self$args), "(none set)"), sep="")
    cat(",args_ready=", ifelse(.self$have_args, .self$args_ready(), "(none set)"), sep="")
    cat(",future=", ifelse(is.null(.self$thefuture), "absent", "present"), sep="")
    cat(",status=", .self$node$status, sep="")
    cat(",result=", ifelse(is.null(.self$result), "(null)", .self$result), sep="")
    cat(",debug=", .self$debug, sep="")
    cat("\n")
  }
)

# ----------------------------------------------------------------
# Let people do 'compute(f)' in addition to 'f$compute()'
##' @family {manual-layer functions}
##' @export
compute <- function(object) 0
setMethod("compute", signature(object = "Delayed"), function(object) {
  object$compute()
})
##' @family {manual-layer functions}
##' @export
compute_sequentially <- function(object) 0
setMethod("compute_sequentially", signature(object = "Delayed"), function(object) {
  object$compute_sequentially()
})

# ----------------------------------------------------------------
# Our data structures have parent->child->parent->... loops if followed
# naively and we want non-stack-overflow as the *default* behavior.
setMethod("str", signature(object = "Delayed"), function(object) {
  object$str()
})
setMethod("show", signature(object = "Delayed"), function(object) {
  object$show()
})
