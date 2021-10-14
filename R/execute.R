##' TileDB Cloud UDF-Execution Helper
##'
##' TODO: WRITE ME
##'
##' TODO: WRITE ME
##'
##' @param udf TODO: WRITE ME
##'
##' @param args TODO: WRITE ME
##'
##' @param namespace TODO: WRITE ME
##'
##' @return TODO: WRITE ME
##' @export
execute_udf <- function(udf, args, namespace) {
  # TODO: expose the error condition in which the caller has tried execute without login first
  client <- .pkgenv[["cl"]] # Expected to be set from login.R
  # if (is.null(client)) { ... }

  apiudf <- UdfApi$new(client)
  gen_udf <- GenericUDF$new()
  gen_udf$language <- UDFLanguage$new("r")
  gen_udf$exec     <- jsonlite::toJSON(as.integer(serialize(udf, NULL)))
  gen_udf$argument <- jsonlite::toJSON(as.integer(serialize(args, NULL)))

  # TODO: handle the case when the return is API-client error
  resultBytes <- apiudf$SubmitGenericUDF(namespace, gen_udf)
  resultString = rawToChar(resultBytes)
  resultJSON = jsonlite::fromJSON(resultString)
  resultValue = resultJSON$value
  resultValue
}
