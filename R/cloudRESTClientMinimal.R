library(R6)
library(httr)
library(jsonlite)

CloudRESTClientMinimal <- R6Class("CloudRESTClientMinimal",
  public = list(
    # constructor
    # Need to pass either host://username:password
    # Or token
    # Or nothing but have ~/.tiledb/cloud.json defined
    initialize = function(host="", username="", password="", token="")
    {
      private$host = host

      if (username != "" && password != "") {
        private$auth = authenticate(username, password)
      } else {
        if (token != "") {
          private$auth = add_headers('X-TILEDB-REST-API-KEY' = token)
        } else {
          cloud_login_data <- fromJSON("~/.tiledb/cloud.json", flatten=FALSE)
          private$host = cloud_login_data$host
          private$auth = add_headers('X-TILEDB-REST-API-KEY' = cloud_login_data$api_key$"X-TILEDB-REST-API-KEY")
        }
      }
    },

    # submit generic UDF
    # namespace to run under
    # f is a user defined function
    # ToDo:
    # Accept arguments for generic udf
    # Accept image name to use
    # Improve serialization, serialize(...) should suffice
    submitGenericUDF = function(namespace, f)
    {
      uri <- paste(private$host, "udfs/generic", namespace, sep="/")

      if (is.null(private$auth)) {
        stop("unable to verify user")
      }

      json_body <- jsonlite::toJSON(list(language = "r", exec = jsonlite::toJSON(as.integer(serialize(f, NULL)))), auto_unbox = TRUE)

      res = POST(
        uri,
        body = json_body,
        encode = "json",
        private$auth
      )

      result <- content(res)
      y <- readBin(result, "integer", n=length(result)/2, size=4, signed=TRUE)
      unserialize(as.raw(y))
    }
  ),

  private = list(
    host = "",
    auth = NULL
  )
)