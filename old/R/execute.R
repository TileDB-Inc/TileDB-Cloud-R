##' TileDB Cloud UDF-Execution Helper
##'
##' This function invokes a user-defined function in TileDB Cloud.
##' Nominally you will first call login(); if not, the results
##' of the last login at ~/.tiledb/cloud.json will be used.
##'
##' The udf and namespace arguments are required; the args argument is
##' optional.
##'
##' @param namespace Namespace within TileDB cloud.
##'
##' @param udf An R function. TODO: more context here on that function's
##' signature.
##'
##' @param args Arguments to the function. If the function takes
##' no arguments, this can be omitted. If you want to call by
##' position, use a list like \code{args=list(123, 456)}. If you want
##' to call by name, use a named list like \code{args=list(x=123,y=456)}.
##'
##' @return The R object which is the return value from the UDF.
##' @export
execute_generic_udf <- function(namespace, udf, args=NULL) {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }

  udfapi <- UdfApi$new(client)
  generic_udf <- GenericUDF$new()
  generic_udf$language <- UDFLanguage$new("r")
  generic_udf$exec <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))
  if (!is.null(args)) {
    generic_udf$argument <- jsonlite::toJSON(as.integer(serialize(args, NULL)))
  }

  # In the successful case, the result will be an R object.  In a failure case
  # such as invalid hostname provided to login, it will be an object of type
  # ApiResponse.

  resultObject <- udfapi$SubmitGenericUDF(namespace, generic_udf)
  if (typeof(resultObject) != "raw") {
    # TODO: extract a function to a R/utils.R
    className <- class(resultObject)[1]
    if (className == "ApiResponse") {
      stop(paste("tiledbcloud: received error response:", resultObject$content))
    } else {
      stop(paste("tiledbcloud: received error response:", class(resultObject)[1]))
    }
  }
  resultString <- rawToChar(resultObject)
  resultJSON <- jsonlite::fromJSON(resultString)
  resultValue <- resultJSON$value
  resultValue
}

##' TileDB Cloud UDF-Execution Helper
##'
##' This function invokes a user-defined function in TileDB Cloud.
##' Nominally you will first call login(); if not, the results
##' of the last login at ~/.tiledb/cloud.json will be used.
##'
##' All arguments are required.
##'
##' @param namespace Namespace within TileDB cloud.
##'
##' @param udf An R function. TODO: more context here on that function's
##' signature.
##'
##' @param array TODO: describe this.
##'
##' @param queryRanges TODO: describe this.
##'
##' @return TODO: describe
##' @export
execute_array_udf <- function(namespace, array, udf, queryRanges) {
  print("ENTER")
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }

  udfapi <- UdfApi$new(client)
  array_udf <- UDF$new()
  array_udf$language <- UDFLanguage$new("r")
  array_udf$exec <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))

  array_udf$ranges = queryRanges

  # Error in self$ranges$toJSON : $ operator is invalid for atomic vectors

  # Python: JSON body as received by the REST server:
  # {
  #   "buffers": [
  #     "a"
  #   ],
  #   "exec": "gAV...FIu",
  #   "exec_raw": "def median(numpy_ordered_dictionary):\n  return numpy.median(numpy_ordered_dictionary[\"a\"])\n",
  #   "image_name": "default",
  #   "language": "python",
  #   "ranges": {
  #     "ranges": [ [ 1, 2 ], [ 1, 2 ] ]
  #   },
  #   "result_format": "native",
  #   "store_results": false,
  #   "stored_param_uuids": [],
  #   "version": "3.7.9"
  # }

  # See also R/udf.R about line 213 or so re array_udf$toJSONString()

  print("PRE:S:002")
  resultObject <- udfapi$SubmitUDF(namespace=namespace, array=array, udf=array_udf)
  print("POST:S:002")

  if (typeof(resultObject) != "raw") {
    # TODO: extract a function to a R/utils.R
    className <- class(resultObject)[1]
    if (className == "ApiResponse") {
      stop(paste("tiledbcloud: received error response:", resultObject$content))
    } else {
      stop(paste("tiledbcloud: received error response:", class(resultObject)[1]))
    }
  }
  resultString <- rawToChar(resultObject)
  resultJSON <- jsonlite::fromJSON(resultString)
  resultValue <- resultJSON$value
  resultValue
}
