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
delayed <- function(func, args=NULL) {
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
  node <- new("Node", payload=.self)
  dag <- new("DAG", namespace=namespace) # TODO
  new("Delayed", func=func, args=args, have_args=have_args, node=node, dag=dag, result=NULL)
}

# ================================================================
delayedGenerator <- setRefClass("Delayed", representation(
  func      = "function",
  args      = "list",
  have_args = "logical",
  # WTF
  # node      = "Node",
  node      = "ANY",
  dag       = "DAG",
  result    = "ANY"
))

delayedGenerator$methods(
  .initialize = function(.self) {
  },

  # This was written first during package dev, and is also perhaps
  # useful for debug.
  compute_sequentially = function(.self) {
    if (!.self$have_args) {
      stop("delayed object must have args set before calling compute")
    }
    evaluated <- lapply(.self$args, function(arg) {
      if (is(arg, "Delayed")) {
        arg$compute()
      } else {
        arg
      }
    })
    .self$result <- do.call(.self$func, evaluated)
    .self$result
  },

  compute = function(.self) {
    # TODO
    .self$compute_sequentially()
  },

  set_args = function(.self, value) {
    stopifnot(is.list(value))
    .self$args <- value
    .self$have_args <- TRUE
    .self$update_parents()
  },

  update_parents = function(.self) {
    for (arg in .self$args) {
      if (is(arg, "Delayed")) {
        .self$node$add_parent(arg$node)
      }
    }
  }

)
