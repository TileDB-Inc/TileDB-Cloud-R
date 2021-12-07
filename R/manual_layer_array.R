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
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  # The $toJSON() converts from R6 class to R named list.
  # That in turn is nicely printable using str().
  arrayApiInstance$GetArrayMetadata(namespace, arrayname)$toJSON()
}

##' Returns a dataframe of metadata for all arrays in your account that meet the
##' filter applied.  Note that this is a paginable API but default params return
##' all results on one call, even hundreds of them. As currently implemented,
##' pagination information is not returned from this function.
##'
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
##' @export
# Note: list_arrays, list_public_arrays, and list_shared_arrays are all but identical.
# They are split out for the following reasons:
# * For regularity with the Python API -- Python and R code-snippet tabs are side-by-side in our
#   webdocs -- we have three separate user-level functions rather than a single one with an
#   owner/public/shared enum/bool/something.
# * In the REST API there are three separate endpoints to call.
# In between those two constraints there isn't much room for code deduplication.

list_arrays <- function(page=NULL, per.page=NULL, search=NULL, namespace=NULL, orderby=NULL, permissions=NULL, tag=NULL, exclude.tag=NULL, file.type=NULL, exclude.file.type=NULL, file.property=NULL, ...) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  resultObject <- arrayApiInstance$ArraysBrowserOwnedGet(page, per.page, search, namespace, orderby, permissions, tag, exclude.tag, file.type, exclude.file.type, file.property)
  bodyAsJSONString <- rawToChar(resultObject)
  # Output has keys 'arrays' and 'pagination_metadata'; keep only the former
  jsonlite::fromJSON(bodyAsJSONString)[["arrays"]]
}

##' Returns a dataframe of metadata for all public arrays accessible from your
##' account that meet the filter applied.  Note that this is a paginable API but
##' default params return all results on one call, even hundreds of them. As
##' currently implemented, pagination information is not returned from this
##' function.
##'
##' @inheritParams list_arrays
##'
##' @return Dataframe of metadata for all public arrays accessible from your account that meet the filter applied.
##' @export
list_public_arrays <- function(page=NULL, per.page=NULL, search=NULL, namespace=NULL, orderby=NULL, permissions=NULL, tag=NULL, exclude.tag=NULL, file.type=NULL, exclude.file.type=NULL, file.property=NULL, ...) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  resultObject <- arrayApiInstance$ArraysBrowserPublicGet(page, per.page, search, namespace, orderby, permissions, tag, exclude.tag, file.type, exclude.file.type, file.property)

  if (typeof(resultObject) != "raw") {
    className <- class(resultObject)[1]
    if (className == "ApiResponse") {
      stop("tiledbcloud: received error response: ", resultObject$content, call.=FALSE)
    } else {
      stop("tiledbcloud: received error response: ", class(resultObject)[1], call.=FALSE)
    }
  }

  bodyAsJSONString <- rawToChar(resultObject)
  # Output has keys 'arrays' and 'pagination_metadata'; keep only the former
  jsonlite::fromJSON(bodyAsJSONString)[["arrays"]]
}

##' Returns a dataframe of metadata for all arrays shared with your account that
##' meet the filter applied.  Note that this is a paginable API but default
##' params return all results on one call, even hundreds of them. As currently
##' implemented, pagination information is not returned from this function.
##'
##' @inheritParams list_arrays
##'
##' @return Dataframe of metadata for all arrays shared with your account that meet the filter applied.
##' @export
list_shared_arrays <- function(page=NULL, per.page=NULL, search=NULL, namespace=NULL, orderby=NULL, permissions=NULL, tag=NULL, exclude.tag=NULL, file.type=NULL, exclude.file.type=NULL, file.property=NULL, ...) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  resultObject <- arrayApiInstance$ArraysBrowserSharedGet(page, per.page, search, namespace, orderby, permissions, tag, exclude.tag, file.type, exclude.file.type, file.property)

  if (typeof(resultObject) != "raw") {
    className <- class(resultObject)[1]
    if (className == "ApiResponse") {
      stop("tiledbcloud: received error response: ", resultObject$content, call.=FALSE)
    } else {
      stop("tiledbcloud: received error response: ", class(resultObject)[1], call.=FALSE)
    }
  }

  bodyAsJSONString <- rawToChar(resultObject)
  # Output has keys 'arrays' and 'pagination_metadata'; keep only the former
  jsonlite::fromJSON(bodyAsJSONString)[["arrays"]]
}
