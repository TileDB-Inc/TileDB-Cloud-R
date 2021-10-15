##' TileDB Cloud UDF-Execution Helper
##'
##' This function invokes a user-defined function in TileDB Cloud.
##' Nominally you will first call login(); if not, the results
##' of the last login at ~/.tiledb/cloud.json will be used.
##'
##' The udf and namespace arguments are required; the args argument is
##' optional.
##'
##' @param udf An R function.
##'
##' @param args Arguments to the function. If the function takes
##' no arguments, this can be omitted. If you want to call by
##' position, use a list like \code{args=list(123, 456)}. If you want
##' to call by name, use a named list like \code{args=list(x=123,y=456)}.
##'
##' @param namespace Namespace within TileDB cloud.
##'
##' @return The R object which is the return value from the UDF.
##' @export
execute_udf <- function(namespace, udf, args=NULL) {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }

  apiudf <- UdfApi$new(client)
  gen_udf <- GenericUDF$new()
  gen_udf$language <- UDFLanguage$new("r")
  gen_udf$exec     <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))
  if (!is.null(args)) {
    gen_udf$argument <- jsonlite::toJSON(as.integer(serialize(args, NULL)))
  }

  # In the successful case, the result will be an R object.  In a failure case
  # such as invalid hostname provided to login, it will be an object of type
  # ApiResponse.

  resultObject <- apiudf$SubmitGenericUDF(namespace, gen_udf)
  if (typeof(resultObject) != "raw") {
    # TODO: extract a function to a R/utils.R
    className <- class(resultObject)[1]
    if (className == "ApiResponse") {
      stop(paste("tiledbcloud: received error response:", resultObject$content))
    } else {
      stop(paste("tiledbcloud: received error response:", class(resultObject)[1]))
    }
  }
  resultString = rawToChar(resultObject)
  resultJSON = jsonlite::fromJSON(resultString)
  resultValue = resultJSON$value
  resultValue
}

# swagger autogen:

# SubmitGenericUDF = function(namespace, udf, accept.encoding=NULL, ...){
#   apiResponse <- self$SubmitGenericUDFWithHttpInfo(namespace, udf, accept.encoding, ...)
#   resp <- apiResponse$response
#   if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
#     apiResponse$content
#   } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
#     apiResponse
#   } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
#     apiResponse
#   } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
#     apiResponse
#   }
# },

# SubmitUDF = function(namespace, array, udf, x.payer=NULL, accept.encoding=NULL, v2=NULL, ...){
#   apiResponse <- self$SubmitUDFWithHttpInfo(namespace, array, udf, x.payer, accept.encoding, v2, ...)
#   resp <- apiResponse$response
#   if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
#     apiResponse$content
#   } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
#     apiResponse
#   } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
#     apiResponse
#   } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
#     apiResponse
#   }
# },
