# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title OrganizationRoles
#'
#' @description OrganizationRoles Class
#'
#' @format An \code{R6Class} generator object
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
OrganizationRoles <- R6::R6Class(
    "OrganizationRoles",
    public = list(
        initialize = function(...) {
            local.optional.var <- list(...)
            val <- unlist(local.optional.var)

            # MANUAL EDIT AFTER OPENAPI AUTOGEN
            .check_openapi_enum("OrganizationRoles", val, .parse_OrganizationRoles())

            private$value <- val
        },
        toJSON = function() {
            jsonlite::toJSON(private$value, auto_unbox = TRUE)
        },
        fromJSON = function(OrganizationRolesJson) {
            private$value <- jsonlite::fromJSON(OrganizationRolesJson,
                simplifyVector = FALSE)
            self
        },
        toJSONString = function() {
            as.character(jsonlite::toJSON(private$value,
                auto_unbox = TRUE))
        },
        fromJSONString = function(OrganizationRolesJson) {
            private$value <- jsonlite::fromJSON(OrganizationRolesJson,
                simplifyVector = FALSE)
            self
        }
    ),
    private = list(
        value = NULL
    )
)

# add to utils.R
.parse_OrganizationRoles <- function(vals) {
    res <- gsub("^\\[|\\]$", "",
        "[owner, admin, read_write, read_only]"
    )
    unlist(strsplit(res, ", "))
}


