# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title UDFFavoritesData
#'
#' @description UDFFavoritesData Class
#'
#' @format An \code{R6Class} generator object
#'
#' @field udfs  list( \link{ArrayInfo} ) [optional]
#'
#' @field pagination_metadata  \link{PaginationMetadata} [optional]
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UDFFavoritesData <- R6::R6Class(
  'UDFFavoritesData',
  public = list(
    `udfs` = NULL,
    `pagination_metadata` = NULL,
    initialize = function(
        `udfs`=NULL, `pagination_metadata`=NULL, ...
    ) {
      local.optional.var <- list(...)
      if (!is.null(`udfs`)) {
        stopifnot(is.vector(`udfs`), length(`udfs`) != 0)
        sapply(`udfs`, function(x) stopifnot(R6::is.R6(x)))
        self$`udfs` <- `udfs`
      }
      if (!is.null(`pagination_metadata`)) {
        stopifnot(R6::is.R6(`pagination_metadata`))
        self$`pagination_metadata` <- `pagination_metadata`
      }
    },
    toJSON = function() {
      UDFFavoritesDataObject <- list()
      if (!is.null(self$`udfs`)) {
        UDFFavoritesDataObject[['udfs']] <-
          lapply(self$`udfs`, function(x) x$toJSON())
      }
      if (!is.null(self$`pagination_metadata`)) {
        UDFFavoritesDataObject[['pagination_metadata']] <-
          self$`pagination_metadata`$toJSON()
      }

      UDFFavoritesDataObject
    },
    fromJSON = function(UDFFavoritesDataJson) {
      UDFFavoritesDataObject <- jsonlite::fromJSON(UDFFavoritesDataJson)
      if (!is.null(UDFFavoritesDataObject$`udfs`)) {
        self$`udfs` <- ApiClient$new()$deserializeObj(UDFFavoritesDataObject$`udfs`, "array[ArrayInfo]", loadNamespace("tiledbcloud"))
      }
      if (!is.null(UDFFavoritesDataObject$`pagination_metadata`)) {
        pagination_metadataObject <- PaginationMetadata$new()
        pagination_metadataObject$fromJSON(jsonlite::toJSON(UDFFavoritesDataObject$pagination_metadata, auto_unbox = TRUE, digits = NA))
        self$`pagination_metadata` <- pagination_metadataObject
      }
      self
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`udfs`)) {
        sprintf(
        '"udfs":
        [%s]
',
        paste(sapply(self$`udfs`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox=TRUE, digits = NA)), collapse=",")
        )},
        if (!is.null(self$`pagination_metadata`)) {
        sprintf(
        '"pagination_metadata":
        %s
        ',
        jsonlite::toJSON(self$`pagination_metadata`$toJSON(), auto_unbox=TRUE, digits = NA)
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(UDFFavoritesDataJson) {
      UDFFavoritesDataObject <- jsonlite::fromJSON(UDFFavoritesDataJson)
      self$`udfs` <- ApiClient$new()$deserializeObj(UDFFavoritesDataObject$`udfs`, "array[ArrayInfo]", loadNamespace("tiledbcloud"))
      self$`pagination_metadata` <- PaginationMetadata$new()$fromJSON(jsonlite::toJSON(UDFFavoritesDataObject$pagination_metadata, auto_unbox = TRUE, digits = NA))
      self
    }
  )
)

