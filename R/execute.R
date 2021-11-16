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
##' @param udf An R function. Arguments are specified separately via \code{args}.
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
##' @param array Name of the array. E.g. if the URI is \code{tiledb://hello/world}
##' then the namespace is "hello" and the array is "world".
##'
##' @param udf An R function which takes a dataframe as argument.
##'
##' @param queryRanges List of two-column matrices, one matrix per dimension,
##' each matrix being a start-end pair.
##'
##' @return Return value from the UDF.
##'
##' @importFrom arrow read_ipc_stream
##'
##' @export
execute_array_udf <- function(namespace, array, udf, selectedRanges, layout=NULL, result_format='native', attrs=NULL) {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }

  udfapi <- UdfApi$new(client)

  # TODO: support multiple arrays. At present we are putting a single array's
  # info into this container.
  multi_array_udf <- MultiArrayUDF$new()
  multi_array_udf$language <- UDFLanguage$new("r")
  multi_array_udf$exec <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))

  # selected_ranges are required for dense arrays; optional for sparse arrays.
  # At the user/library level this is a list of two-column matrices, e.g.
  # 'list(cbind(1,2), cbind(3,4))'.

  # TODO: parameterize in the argument list.
  layout <- Layout$new('row-major')

  queryRanges <- QueryRanges$new(layout=layout, ranges=selectedRanges)
  multi_array_udf$ranges = queryRanges

  if (!is.null(result_format)) {
    multi_array_udf$result_format <- ResultFormat$new(result_format)
  }

  # Attrs can be optionally specified by the client. If they are not, the
  # server-side code will load all attributes.
  if (!is.null(attrs)) {
    multi_array_udf$buffers <- attrs
  }

  # Make the network request.
  result <- udfapi$SubmitUDF(namespace=namespace, array=array, udf=multi_array_udf)

  # Decode the results.
  if (typeof(result) != "raw") {
    className <- class(result)[1]
    if (className == "ApiResponse") {
      stop("tiledbcloud: received error response: ", result$content, call.=FALSE)
    } else {
      stop("tiledbcloud: received error response: ", class(result)[1], call.=FALSE)
    }
  }
  # This is a serialized R object sent from the server-side R code, passed
  # through as-is by the REST server (opaquely to it), to the client-side R
  # code (us).

  formattedResult <- NULL
  switch(result_format,
    native={
      formattedResult <- unserialize(result, NULL)
    },
    json={
      resultString <- rawToChar(result)
      resultJSON <- jsonlite::fromJSON(resultString)
      formattedResult <- resultJSON$value
    },
    arrow={
      formattedResult <- arrow::read_ipc_stream(result)
    },
    stop("Result format unrecognized: ", result_format)
  )

  formattedResult
}
