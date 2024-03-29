# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title UDFType
#'
#' @description UDFType Class
#'
#' @format An \code{R6Class} generator object
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UDFType <- R6::R6Class(
    "UDFType",
    public = list(
        initialize = function(...) {
            local.optional.var <- list(...)
            val <- unlist(local.optional.var)

            # MANUAL EDIT AFTER OPENAPI AUTOGEN
            .check_openapi_enum("UDFType", val, .parse_UDFType())

            private$value <- val
        },
        toJSON = function() {
            jsonlite::toJSON(private$value, auto_unbox = TRUE)
        },
        fromJSON = function(UDFTypeJson) {
            private$value <- jsonlite::fromJSON(UDFTypeJson,
                simplifyVector = FALSE)
            self
        },
        toJSONString = function() {
            as.character(jsonlite::toJSON(private$value,
                auto_unbox = TRUE))
        },
        fromJSONString = function(UDFTypeJson) {
            private$value <- jsonlite::fromJSON(UDFTypeJson,
                simplifyVector = FALSE)
            self
        }
    ),
    private = list(
        value = NULL
    )
)

# add to utils.R
.parse_UDFType <- function(vals) {
  list('generic', 'single_array', 'multi_array')
}
