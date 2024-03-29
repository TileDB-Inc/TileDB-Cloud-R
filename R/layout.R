# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title Layout
#'
#' @description Layout Class
#'
#' @format An \code{R6Class} generator object
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Layout <- R6::R6Class(
    "Layout",
    public = list(
        initialize = function(...) {
            local.optional.var <- list(...)
            val <- unlist(local.optional.var)

            # MANUAL EDIT AFTER OPENAPI AUTOGEN
            .check_openapi_enum("Layout", val, .parse_Layout())

            private$value <- val
        },
        toJSON = function() {
            jsonlite::toJSON(private$value, auto_unbox = TRUE)
        },
        fromJSON = function(LayoutJson) {
            private$value <- jsonlite::fromJSON(LayoutJson,
                simplifyVector = FALSE)
            self
        },
        toJSONString = function() {
            as.character(jsonlite::toJSON(private$value,
                auto_unbox = TRUE))
        },
        fromJSONString = function(LayoutJson) {
            private$value <- jsonlite::fromJSON(LayoutJson,
                simplifyVector = FALSE)
            self
        }
    ),
    private = list(
        value = NULL
    )
)

# add to utils.R
.parse_Layout <- function(vals) {
    res <- gsub("^\\[|\\]$", "",
        "[row-major, col-major, global-order, unordered]"
    )
    unlist(strsplit(res, ", "))
}


