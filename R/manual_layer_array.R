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
##' @family {manual-layer functions}
##' @export
array_info <- function(namespace, arrayname) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  # The $toJSON() converts from R6 class to R named list.
  # That in turn is nicely printable using str().
  arrayApiInstance$GetArrayMetadata(namespace, arrayname)$toJSON()
}

##' Returns a dataframe of metadata for all arrays that meet the
##' filter applied.  Note that this is a paginable API but default params return
##' all results on one call, even hundreds of them. As currently implemented,
##' pagination information is not returned from this function. The \code{public}
##' \code{shared} arguments may not both be true.
##'
##' @param public logical TRUE means list public arrays
##' @param shared logical TRUE means list shared arrays. If \code{public} and \code{shared} are both
##' false then arrays owned by you are listed.
##' @param page integer
##' @param per.page integer
##' @param search character
##' @param namespace character
##' @param orderby character
##' @param permissions character
##' @param tag list( character )
##' @param exclude.tag list( character )
##' @param file.type list( character )
##' @param exclude.file.type list( character )
##' @param file.property list( character )
##'
##' @return Dataframe of metadata for all arrays in your account that meet the filter applied.
##' @family {manual-layer functions}
##' @export
list_arrays <- function(public=FALSE, shared=FALSE, page=NULL, per.page=NULL, search=NULL, namespace=NULL,
  orderby=NULL, permissions=NULL, tag=NULL, exclude.tag=NULL, file.type=NULL, exclude.file.type=NULL, file.property=NULL, ...) {
  if (public && shared) {
    stop("The public and shared arguments must not both be TRUE.")
  }
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)

  if (public) {
    resultObject <- arrayApiInstance$ArraysBrowserPublicGet(page, per.page, search, namespace, orderby,
      permissions, tag, exclude.tag, file.type, exclude.file.type, file.property)
  } else if (shared) {
    resultObject <- arrayApiInstance$ArraysBrowserSharedGet(page, per.page, search, namespace, orderby,
      permissions, tag, exclude.tag, file.type, exclude.file.type, file.property)
  } else {
    resultObject <- arrayApiInstance$ArraysBrowserOwnedGet(page, per.page, search, namespace, orderby,
      permissions, tag, exclude.tag, file.type, exclude.file.type, file.property)
  }

  body <- .get_raw_response_body_or_stop(resultObject)

  bodyAsJSONString <- rawToChar(body)
  # Output has keys 'arrays' and 'pagination_metadata'; keep only the former
  jsonlite::fromJSON(bodyAsJSONString)[["arrays"]]
}
