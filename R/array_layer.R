##' TileDB Cloud Manual Layer for Array Info
##'
##' This function shows array information on TileDB Cloud.  Nominally you will
##' first call login(); if not, the results of the last login at
##' ~/.tiledb/cloud.json will be used.
##'
##' @param namespace Like "TileDB-Inc"
##'
##' @param arrayname Like "quickstart_dense"
##'
##' @return A list of array properties
##' @export
array_info <- function(namespace, arrayname) {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }
  api.instance <- ArrayApi$new(client)
  # The $toJSON() converts from R6 class to R named list.
  # That in turn is nicely printable using str().
  api.instance$GetArrayMetadata(namespace, arrayname)$toJSON()
}
