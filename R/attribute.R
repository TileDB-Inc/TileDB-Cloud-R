# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title Attribute
#'
#' @description Attribute Class
#'
#' @format An \code{R6Class} generator object
#'
#' @field name  character 
#'
#' @field type  \link{Datatype} 
#'
#' @field filterPipeline  \link{FilterPipeline} 
#'
#' @field cellValNum  integer 
#'
#' @field nullable  character [optional]
#'
#' @field fillValue  list( integer ) [optional]
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Attribute <- R6::R6Class(
  'Attribute',
  public = list(
    `name` = NULL,
    `type` = NULL,
    `filterPipeline` = NULL,
    `cellValNum` = NULL,
    `nullable` = NULL,
    `fillValue` = NULL,
    initialize = function(
        `name`, `type`, `filterPipeline`, `cellValNum`, `nullable`=NULL, `fillValue`=NULL, ...
    ) {
      local.optional.var <- list(...)
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`type`)) {
        stopifnot(R6::is.R6(`type`))
        self$`type` <- `type`
      }
      if (!missing(`filterPipeline`)) {
        stopifnot(R6::is.R6(`filterPipeline`))
        self$`filterPipeline` <- `filterPipeline`
      }
      if (!missing(`cellValNum`)) {
        stopifnot(is.numeric(`cellValNum`), length(`cellValNum`) == 1)
        self$`cellValNum` <- `cellValNum`
      }
      if (!is.null(`nullable`)) {
        self$`nullable` <- `nullable`
      }
      if (!is.null(`fillValue`)) {
        stopifnot(is.vector(`fillValue`), length(`fillValue`) != 0)
        sapply(`fillValue`, function(x) stopifnot(is.character(x)))
        self$`fillValue` <- `fillValue`
      }
    },
    toJSON = function() {
      AttributeObject <- list()
      if (!is.null(self$`name`)) {
        AttributeObject[['name']] <-
          self$`name`
      }
      if (!is.null(self$`type`)) {
        AttributeObject[['type']] <-
          self$`type`$toJSON()
      }
      if (!is.null(self$`filterPipeline`)) {
        AttributeObject[['filterPipeline']] <-
          self$`filterPipeline`$toJSON()
      }
      if (!is.null(self$`cellValNum`)) {
        AttributeObject[['cellValNum']] <-
          self$`cellValNum`
      }
      if (!is.null(self$`nullable`)) {
        AttributeObject[['nullable']] <-
          self$`nullable`
      }
      if (!is.null(self$`fillValue`)) {
        AttributeObject[['fillValue']] <-
          self$`fillValue`
      }

      AttributeObject
    },
    fromJSON = function(AttributeJson) {
      AttributeObject <- jsonlite::fromJSON(AttributeJson)
      if (!is.null(AttributeObject$`name`)) {
        self$`name` <- AttributeObject$`name`
      }
      if (!is.null(AttributeObject$`type`)) {
        # MANUAL EDIT AFTER OPENAPI AUTOGEN
        # For enums, OpenAPI autogen (1) generates a constructor which requires being called
        # with one arguent; (2) generates callsites (such as here) that calls that constructor
        # with zero arguments.
        #
        #typeObject <- Datatype$new()
        #typeObject$fromJSON(jsonlite::toJSON(AttributeObject$type, auto_unbox = TRUE, digits = NA))
        typeObject <- Datatype$new(AttributeObject$type)
        self$`type` <- typeObject
      }
      if (!is.null(AttributeObject$`filterPipeline`)) {
        filterPipelineObject <- FilterPipeline$new()
        filterPipelineObject$fromJSON(jsonlite::toJSON(AttributeObject$filterPipeline, auto_unbox = TRUE, digits = NA))
        self$`filterPipeline` <- filterPipelineObject
      }
      if (!is.null(AttributeObject$`cellValNum`)) {
        self$`cellValNum` <- AttributeObject$`cellValNum`
      }
      if (!is.null(AttributeObject$`nullable`)) {
        self$`nullable` <- AttributeObject$`nullable`
      }
      if (!is.null(AttributeObject$`fillValue`)) {
        self$`fillValue` <- ApiClient$new()$deserializeObj(AttributeObject$`fillValue`, "array[integer]", loadNamespace("tiledbcloud"))
      }
      self
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`name`)) {
        sprintf(
        '"name":
          "%s"
                ',
        self$`name`
        )},
        if (!is.null(self$`type`)) {
        sprintf(
        '"type":
        %s
        ',
        jsonlite::toJSON(self$`type`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`filterPipeline`)) {
        sprintf(
        '"filterPipeline":
        %s
        ',
        jsonlite::toJSON(self$`filterPipeline`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`cellValNum`)) {
        sprintf(
        '"cellValNum":
          %d
                ',
        self$`cellValNum`
        )},
        if (!is.null(self$`nullable`)) {
        sprintf(
        '"nullable":
          "%s"
                ',
        self$`nullable`
        )},
        if (!is.null(self$`fillValue`)) {
        sprintf(
        '"fillValue":
           [%s]
        ',
        paste(unlist(lapply(self$`fillValue`, function(x) paste0('"', x, '"'))), collapse=",")
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(AttributeJson) {
      AttributeObject <- jsonlite::fromJSON(AttributeJson)
      self$`name` <- AttributeObject$`name`
      self$`type` <- Datatype$new()$fromJSON(jsonlite::toJSON(AttributeObject$type, auto_unbox = TRUE, digits = NA))
      self$`filterPipeline` <- FilterPipeline$new()$fromJSON(jsonlite::toJSON(AttributeObject$filterPipeline, auto_unbox = TRUE, digits = NA))
      self$`cellValNum` <- AttributeObject$`cellValNum`
      self$`nullable` <- AttributeObject$`nullable`
      self$`fillValue` <- ApiClient$new()$deserializeObj(AttributeObject$`fillValue`, "array[integer]", loadNamespace("tiledbcloud"))
      self
    }
  )
)

