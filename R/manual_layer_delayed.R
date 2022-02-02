##' Define a function to be executed within a task graph
##'
##' @param args Can be provided here with \code{c <- delayed(function(...) { sum(...) }, args=list(a,b))}
##' or ##' separately with \code{c <- delayed(function(...) { sum(...) })` and later
##' \code{c$args <- list(a,b)}.
##'
##' @param name Optional -- e.g. \code{a} or \code{b}. If omitted, it defaults to a UUID.
##'
##' @param local If true, execute the functions on the local host; if else, execute them as
##' UDFs in TileDB Cloud.
##'
##' @return A task-graph node object on which you can later call \code{compute}.
##'
##' @family {manual-layer functions}
##' @export
delayed <- function(func, args=NULL, name=NULL, local=FALSE) {
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

  Node$new(func=func, args=args, have_args=have_args, name=name, local=local)
}

##' Define a SQL query function to be executed within a task graph
##'
##' @param query SQL query string -- see vignette for examples
##'
##' @param name A display name for the query
##'
##' @param namespace The TileDB-Cloud namespace to charge the query to
##'
##' @return A task-graph node object on which you can later call \code{compute}.  The return value from
##' compute() will be the query result as a dataframe.  Note that results will be strings, so numerical
##' results will need to be explicitly cast as such.
##'
##' @family {manual-layer functions}
##' @export
delayed_sql <- function(query, name, namespace) {
  # It is absolutely necessary that this be a locally executing call to the
  # remote REST service. A non-local execution of this would mean the REST
  # server calling itself -- not only would that be a circular dependency, but
  # moreover the tiledbcloud is not running on the REST server.
  delayed(function() {
    execute_sql_query(query=query, name=name, namespace=namespace)
  }, local=TRUE)
}

##' Define a generic UDF to be executed within a task graph
##'
##' @param namespace The TileDB-Cloud namespace to charge the query to
##'
##' @param udf An R function. Arguments are specified separately via \code{args}.
##' One of \code{udf} and \code{registered_udf_name} must be non-null.
##'
##' @param registered_udf_name Name of a registered UDF, of the form \code{namespace/udfname}.
##' Arguments are specified separately via \code{args}.  One of \code{udf} and
##' \code{registered_udf_name} must be non-null.
##'
##' @param args Can be provided here with \code{c <- delayed(function(...) { sum(...) }, args=list(a,b))}
##' or ##' separately with \code{c <- delayed_generic_udf(...)` and later \code{c$args <- list(a,b)}.
##'
##' @param name Optional -- e.g. \code{a} or \code{b}. If omitted, it defaults to a UUID.
##'
##' @return The return value from the UDF as an R object.
##'
##' @family {manual-layer functions}
##' @export
delayed_generic_udf <- function(namespace, udf=NULL, registered_udf_name=NULL, args=NULL, name=NULL)
{
  # It is absolutely necessary that this be a locally executing call to the
  # remote REST service. A non-local execution of this would mean the REST
  # server calling itself -- not only would that be a circular dependency, but
  # moreover the tiledbcloud is not running on the REST server.

  if (is.null(udf) && is.null(registered_udf_name)) {
    stop("One, but not both, of udf and registered_udf_name must be provided.")
  }
  if (!is.null(udf) && !is.null(registered_udf_name)) {
    stop("One, but not both, of udf and registered_udf_name must be provided.")
  }

  delayed(
    func=function(...) {
      execute_generic_udf(
        namespace=namespace,
        udf=udf,
        registered_udf_name=registered_udf_name,
        args=list(...))
    },
    args=args,
    name=NULL,
    local=TRUE)
}

##' Define a single-array UDF to be executed within a task graph
##'
##' @param namespace The TileDB-Cloud namespace to charge the query to
##'
##' @param array TileDB URI -- see vignette for examples.
##'
##' @param udf User-defined function, as in UDF examples.
##'
##' @param selectedRanges As in UDF examples.
##'
##' @param attrs As in UDF examples.
##'
##' @return The return value from the UDF as an R object.
##'
##' @family {manual-layer functions}
##' @export
delayed_array_udf <- function(namespace, array, udf, selectedRanges, attrs) {
  # It is absolutely necessary that this be a locally executing call to the
  # remote REST service. A non-local execution of this would mean the REST
  # server calling itself -- not only would that be a circular dependency, but
  # moreover the tiledbcloud is not running on the REST server.

  # TODO: more args are supported in execute_array_udf; support them here.
  delayed(function() {
    execute_array_udf(
      array=array,
      namespace=namespace,
      udf=udf,
      selectedRanges=selectedRanges,
      attrs=attrs)
  }, local=TRUE)
}
