# TODO:
# * rox-style docblocks
# * description:imports
# * if formals(d) is zero-length then set arg=list() & have_args=TRUE

# ================================================================
##' delayed is an exported factory function for the "Delayed" implementation class.
##'
##' Intentionally, Delayed has non-public consructor, but a few public generic accessors.
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
  dag <- new("DAG", namespace=namespace) # TODO
  new("Delayed", func=func, args=args, have_args=have_args, dag=dag, result=NULL)
}

# ================================================================
setClass("Delayed", representation(
  func      = "function",
  args      = "list",
  have_args = "logical",
  dag       = "DAG",
  foo       = "list",
  result    = "ANY"
))

##' @export
compute <- function(object) 0
setGeneric("compute")
setMethod("compute", signature(object = "Delayed"), function(object) {
  if (!object@have_args) {
    stop("delayed object must have args set before calling compute")
  }
  evaluated <- lapply(object@args, function(arg) {
    if (is(arg, "Delayed")) {
      compute(arg)
    } else {
      arg
    }
  })

  object@result <- do.call(object@func, evaluated)
  object@result
})

# if self.dag is None:
#     self.__set_all_parent_nodes_same_dag(DAG(namespace=namespace))
# if namespace is not None:
#     self.dag.namespace = namespace
# self.dag.compute()
# self.dag.wait(self.timeout)
# return self.result()

##' @export
setGeneric("args<-", function(object, value) standardGeneric("args<-"))
setMethod("args<-", signature(object = "Delayed"), function(object, value) {
  stopifnot(is.list(value))
  object@args = value
  object@have_args = TRUE
  object
})
