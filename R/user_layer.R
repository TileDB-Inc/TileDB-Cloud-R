##' TileDB Cloud Manual Layer for User Info
##'
##' This function shows user information for the  currently logged-in account on
##' TileDB Cloud.  Nominally you will first call login(); if not, the results of
##' the last login at ~/.tiledb/cloud.json will be used.
##'
##' @param include_logo If set to True, include the \code{logo} field in the return value.
##' By default this is omitted since it's a long base64-encoded string which takes up
##' a lot of screen space and is likely uninteresting.
##'
##' @return A list of user properties from the currently logged-in TileDB cloud account.
##' @export
user_profile <- function(include_logo=FALSE) {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }
  api.instance <- UserApi$new(client)

  info <- api.instance$GetUser()
  if (!include_logo) {
    info[["logo"]] <- NULL
  }
  info
}
