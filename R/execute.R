##' TileDB Cloud UDF-Execution Helper for Generic UDFs
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

##' TileDB Cloud UDF-Execution Helper for Single-Array UDFs
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
##' @param selectedRanges List of two-column matrices, one matrix per dimension,
##' each matrix being a start-end pair: e.g. \code{list(cbind(1,10),cbind(1,20))}.
##'
##' @param attrs Optional list of attributes (default: all) for the server-side
##' code to select for UDF execution. Specifying only what your UDF needs is
##' useful for memory-usage control.
##'
##' @param layout One of \code{row-major}, \code{col-major}, \code{global-order}, or
##' \code{unordered},
##'
##' @param result_format One of \code{native}, \code{json}, or \code{arrow}. These are
##' used as wire format for returning results from the server to this library, primarily
##' for memory-usage control.  UDF return values handed back to your code from this
##' library are converted back to natural R objects.
##'
##' @param attrs
##'
##' @return Return value from the UDF.
##'
##' @importFrom arrow read_ipc_stream
##'
##' @export
execute_array_udf <- function(namespace, array, udf, selectedRanges, attrs=NULL, layout=NULL, result_format='native') {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }

  udfapi <- UdfApi$new(client)

  # This function is for single arrays which are packed a little differently
  # from the way the multi-array function does it. Namely, here we pass buffers &
  # ranges outside of the multi_array_udf object.
  multi_array_udf <- MultiArrayUDF$new()
  multi_array_udf$language <- UDFLanguage$new("r")
  multi_array_udf$exec <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))

  # selected_ranges are required for dense arrays; optional for sparse arrays.
  # At the user/library level this is a list of two-column matrices, e.g.
  # 'list(cbind(1,2), cbind(3,4))'.

  if (!is.null(layout)) {
    layout <- Layout$new(layout)
  }

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

##' TileDB Cloud UDF-Execution Helper for multiple-array UDFs
##'
##' This function invokes a user-defined function in TileDB Cloud.
##' Nominally you will first call login(); if not, the results
##' of the last login at ~/.tiledb/cloud.json will be used.
##'
##' All arguments are required.
##'
##' @param namespace Namespace within TileDB cloud.
##'
##' @param array_list List of \code{UDFArrayDetails} objects.
##' Example list element: \code{tiledbcloud::UDFArrayDetails$new(uri="tiledb://demo/quickstart_dense", ranges=QueryRanges$new(layout=Layout$new('row-major'), ranges=list(cbind(1,4),cbind(1,4))), buffers=list("a"))}
##'
##' @param udf An R function which takes dataframes as arguments, one dataframe argument for each element in \code{array_list}.
##'
##' @param result_format One of \code{native}, \code{json}, or \code{arrow}. These are
##' used as wire format for returning results from the server to this library, primarily
##' for memory-usage control.  UDF return values handed back to your code from this
##' library are converted back to natural R objects.
##'
##' @return Return value from the UDF.
##' @export
execute_multi_array_udf <- function(namespace, array_list, udf, result_format=NULL) {
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  if (is.null(client)) {
    stop("tiledbcloud: unable to find login credentials. Please use login().")
  }

  udfapi <- UdfApi$new(client)

  multi_array_udf <- MultiArrayUDF$new()
  multi_array_udf$language <- UDFLanguage$new("r")
  multi_array_udf$exec <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))
  if (!is.null(result_format)) {
    multi_array_udf$result_format <- ResultFormat$new(result_format)
  }

  # TODO: type-check the array_list parameter to be sure it's list of UDFArrayDetails
  multi_array_udf$arrays <- array_list

  # Make the network request.
  resultObject <- udfapi$SubmitMultiArrayUDF(namespace=namespace, udf=multi_array_udf)

  # Decode the results.
  if (typeof(resultObject) != "raw") {
    className <- class(resultObject)[1]
    if (className == "ApiResponse") {
      stop("tiledbcloud: received error response: ", resultObject$content, call.=FALSE)
    } else {
      stop("tiledbcloud: received error response: ", class(resultObject)[1], call.=FALSE)
    }
  }
  # This is a serialized R object sent from the server-side R code, passed
  # through as-is by the REST server (opaquely to it), to the client-side R
  # code (us).
  resultString <- rawToChar(resultObject)
  resultJSON <- jsonlite::fromJSON(resultString)
  resultValue <- resultJSON$value
  resultValue
}
