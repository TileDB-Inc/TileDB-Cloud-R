##' Fetch Task Details on TileDB Cloud
##'
##' This fetchs details of a running or completed task in TileDB Cloud.
##'
##' Nominally you will first call \code{\link{login}}; if not, the results
##' of the last login at \code{~/.tiledb/cloud.json} will be used.
##'
##' @param uuid UUID of task to fetch
##'
##' @return The task details
##' @family {manual-layer functions}
##' @export
task <- function(uuid) {
  api.client.instance <- get_api_client_instance()
  task.api.instance <- task <- TasksApi$new(api.client.instance)

  resultObject <- task$TaskIdGet(uuid)

  # Decode the result
  body <- .get_raw_response_body_or_stop(resultObject)
  taskDetails <- jsonlite::fromJSON(rawToChar(body))

  taskDetails
}
