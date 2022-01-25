##' Execute a SQL query on TileDB Cloud
##'
##' This invokes a user-defined function in TileDB Cloud.
##'
##' Nominally you will first call \code{\link{login}}; if not, the results
##' of the last login at \code{~/.tiledb/cloud.json} will be used.
##'
##' The \code{udf} and \code{namespace} arguments are required; the \code{args}
##' argument is optional.
##'
##' @param query SQL query as a string.
##'
##' @param name A descriptive name to give the query.
##'
##' @param namespace Namespace within TileDB cloud.
##'
##' @return The result of the SQL query.
##' @family {manual-layer functions}
##' @export
execute_generic_udf <- function(query, name, namespace) {

  api.client.instance <- tiledbcloud:::.get_api_client_instance()
  sql.api.instance <- sql <- SqlApi$new(api.client.instance)

  sql.parameters <-  SQLParameters$new(name=name, query=query)

  sql$RunSQL(namespace, sql.parameters)
}
