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

##' TODO: comment
##' xxx note this is a paginable API but default params are all-at-once
##' @export

# Help on function list_arrays in module tiledb.cloud.client:
#
# list_arrays(namespace=None, permissions=None, tag=None, exclude_tag=None, search=None, file_type=None, exclude_file_type=None, page=None, per_page=None, async_req=False)
#     List arrays in a user account
#
#     :param str namespace: list arrays in single namespace
#     :param str permissions: filter arrays for given permissions
#     :param list tag: zero or more tags to filter on
#     :param list exclude_tag: zero or more tags to filter on
#     :param str search: search string
#     :param list file_type: zero or more file_types to filter on
#     :param list exclude_file_type: zero or more file_types to filter on
#     :param int page: optional page for pagination
#     :param int per_page: optional per_page for pagination
#     :param async_req: return future instead of results for async support
#     :return: list of all array metadata you have access to that meet the filter applied




list_arrays <- function(namespace=NULL, permissions=NULL) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  resultObject <- arrayApiInstance$ArraysBrowserOwnedGet()
  bodyAsJSONString <- rawToChar(resultObject)
  # Output has keys 'arrays' and 'pagination_metadata'; keep only the former
  jsonlite::fromJSON(bodyAsJSONString)[["arrays"]]
}

##' TODO: comment
##' xxx note this is a paginable API but default params are all-at-once
##' @export
list_public_arrays <- function(namespace=NULL, permissions=NULL) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  resultObject <- arrayApiInstance$ArraysBrowserPublicGet()

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

##' TODO: comment
##' xxx note this is a paginable API but default params are all-at-once
##' @export
list_shared_arrays <- function(namespace=NULL, permissions=NULL) {
  apiClientInstance <- get_api_client_instance()
  arrayApiInstance <- ArrayApi$new(apiClientInstance)
  resultObject <- arrayApiInstance$ArraysBrowserSharedGet()

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
