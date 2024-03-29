# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title ArraySchema
#'
#' @description ArraySchema Class
#'
#' @format An \code{R6Class} generator object
#'
#' @field uri  character [optional]
#'
#' @field version  list( integer ) 
#'
#' @field arrayType  \link{ArrayType} 
#'
#' @field tileOrder  \link{Layout} 
#'
#' @field cellOrder  \link{Layout} 
#'
#' @field capacity  integer 
#'
#' @field coordsFilterPipeline  \link{FilterPipeline} 
#'
#' @field offsetFilterPipeline  \link{FilterPipeline} 
#'
#' @field domain  \link{Domain} 
#'
#' @field attributes  list( \link{Attribute} ) 
#'
#' @field allowsDuplicates  character [optional]
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ArraySchema <- R6::R6Class(
  'ArraySchema',
  public = list(
    `uri` = NULL,
    `version` = NULL,
    `arrayType` = NULL,
    `tileOrder` = NULL,
    `cellOrder` = NULL,
    `capacity` = NULL,
    `coordsFilterPipeline` = NULL,
    `offsetFilterPipeline` = NULL,
    `domain` = NULL,
    `attributes` = NULL,
    `allowsDuplicates` = NULL,
    initialize = function(
        `version`, `arrayType`, `tileOrder`, `cellOrder`, `capacity`, `coordsFilterPipeline`, `offsetFilterPipeline`, `domain`, `attributes`, `uri`=NULL, `allowsDuplicates`=NULL, ...
    ) {
      local.optional.var <- list(...)
      if (!missing(`version`)) {
        stopifnot(is.vector(`version`), length(`version`) != 0)
        sapply(`version`, function(x) stopifnot(is.character(x)))
        self$`version` <- `version`
      }
      if (!missing(`arrayType`)) {
        stopifnot(R6::is.R6(`arrayType`))
        self$`arrayType` <- `arrayType`
      }
      if (!missing(`tileOrder`)) {
        stopifnot(R6::is.R6(`tileOrder`))
        self$`tileOrder` <- `tileOrder`
      }
      if (!missing(`cellOrder`)) {
        stopifnot(R6::is.R6(`cellOrder`))
        self$`cellOrder` <- `cellOrder`
      }
      if (!missing(`capacity`)) {
        stopifnot(is.numeric(`capacity`), length(`capacity`) == 1)
        self$`capacity` <- `capacity`
      }
      if (!missing(`coordsFilterPipeline`)) {
        stopifnot(R6::is.R6(`coordsFilterPipeline`))
        self$`coordsFilterPipeline` <- `coordsFilterPipeline`
      }
      if (!missing(`offsetFilterPipeline`)) {
        stopifnot(R6::is.R6(`offsetFilterPipeline`))
        self$`offsetFilterPipeline` <- `offsetFilterPipeline`
      }
      if (!missing(`domain`)) {
        stopifnot(R6::is.R6(`domain`))
        self$`domain` <- `domain`
      }
      if (!missing(`attributes`)) {
        stopifnot(is.vector(`attributes`), length(`attributes`) != 0)
        sapply(`attributes`, function(x) stopifnot(R6::is.R6(x)))
        self$`attributes` <- `attributes`
      }
      if (!is.null(`uri`)) {
        stopifnot(is.character(`uri`), length(`uri`) == 1)
        self$`uri` <- `uri`
      }
      if (!is.null(`allowsDuplicates`)) {
        self$`allowsDuplicates` <- `allowsDuplicates`
      }
    },
    toJSON = function() {
      ArraySchemaObject <- list()
      if (!is.null(self$`uri`)) {
        ArraySchemaObject[['uri']] <-
          self$`uri`
      }
      if (!is.null(self$`version`)) {
        ArraySchemaObject[['version']] <-
          self$`version`
      }
      if (!is.null(self$`arrayType`)) {
        ArraySchemaObject[['arrayType']] <-
          self$`arrayType`$toJSON()
      }
      if (!is.null(self$`tileOrder`)) {
        ArraySchemaObject[['tileOrder']] <-
          self$`tileOrder`$toJSON()
      }
      if (!is.null(self$`cellOrder`)) {
        ArraySchemaObject[['cellOrder']] <-
          self$`cellOrder`$toJSON()
      }
      if (!is.null(self$`capacity`)) {
        ArraySchemaObject[['capacity']] <-
          self$`capacity`
      }
      if (!is.null(self$`coordsFilterPipeline`)) {
        ArraySchemaObject[['coordsFilterPipeline']] <-
          self$`coordsFilterPipeline`$toJSON()
      }
      if (!is.null(self$`offsetFilterPipeline`)) {
        ArraySchemaObject[['offsetFilterPipeline']] <-
          self$`offsetFilterPipeline`$toJSON()
      }
      if (!is.null(self$`domain`)) {
        ArraySchemaObject[['domain']] <-
          self$`domain`$toJSON()
      }
      if (!is.null(self$`attributes`)) {
        ArraySchemaObject[['attributes']] <-
          lapply(self$`attributes`, function(x) x$toJSON())
      }
      if (!is.null(self$`allowsDuplicates`)) {
        ArraySchemaObject[['allowsDuplicates']] <-
          self$`allowsDuplicates`
      }

      ArraySchemaObject
    },
    fromJSON = function(ArraySchemaJson) {
      ArraySchemaObject <- jsonlite::fromJSON(ArraySchemaJson)
      if (!is.null(ArraySchemaObject$`uri`)) {
        self$`uri` <- ArraySchemaObject$`uri`
      }
      if (!is.null(ArraySchemaObject$`version`)) {
        self$`version` <- ApiClient$new()$deserializeObj(ArraySchemaObject$`version`, "array[integer]", loadNamespace("tiledbcloud"))
      }
      if (!is.null(ArraySchemaObject$`arrayType`)) {
        # MANUAL EDIT AFTER OPENAPI AUTOGEN
        # For enums, OpenAPI autogen (1) generates a constructor which requires being called
        # with one arguent; (2) generates callsites (such as here) that calls that constructor
        # with zero arguments.
        #
        #arrayTypeObject <- ArrayType$new()
        #arrayTypeObject$fromJSON(jsonlite::toJSON(ArraySchemaObject$arrayType, auto_unbox = TRUE, digits = NA))
        arrayTypeObject <- ArrayType$new(ArraySchemaObject$arrayType)
        self$`arrayType` <- arrayTypeObject
      }
      if (!is.null(ArraySchemaObject$`tileOrder`)) {
        # MANUAL EDIT AFTER OPENAPI AUTOGEN
        # For enums, OpenAPI autogen (1) generates a constructor which requires being called
        # with one arguent; (2) generates callsites (such as here) that calls that constructor
        # with zero arguments.
        #
        #tileOrderObject <- Layout$new()
        #tileOrderObject$fromJSON(jsonlite::toJSON(ArraySchemaObject$tileOrder, auto_unbox = TRUE, digits = NA))
        tileOrderObject <- Layout$new(ArraySchemaObject$tileOrder)
        self$`tileOrder` <- tileOrderObject
      }
      if (!is.null(ArraySchemaObject$`cellOrder`)) {
        # MANUAL EDIT AFTER OPENAPI AUTOGEN
        # For enums, OpenAPI autogen (1) generates a constructor which requires being called
        # with one arguent; (2) generates callsites (such as here) that calls that constructor
        # with zero arguments.
        #
        #cellOrderObject <- Layout$new()
        #cellOrderObject$fromJSON(jsonlite::toJSON(ArraySchemaObject$cellOrder, auto_unbox = TRUE, digits = NA))
        cellOrderObject <- Layout$new(ArraySchemaObject$cellOrder)
        self$`cellOrder` <- cellOrderObject
      }
      if (!is.null(ArraySchemaObject$`capacity`)) {
        self$`capacity` <- ArraySchemaObject$`capacity`
      }
      if (!is.null(ArraySchemaObject$`coordsFilterPipeline`)) {
        coordsFilterPipelineObject <- FilterPipeline$new()
        coordsFilterPipelineObject$fromJSON(jsonlite::toJSON(ArraySchemaObject$coordsFilterPipeline, auto_unbox = TRUE, digits = NA))
        self$`coordsFilterPipeline` <- coordsFilterPipelineObject
      }
      if (!is.null(ArraySchemaObject$`offsetFilterPipeline`)) {
        offsetFilterPipelineObject <- FilterPipeline$new()
        offsetFilterPipelineObject$fromJSON(jsonlite::toJSON(ArraySchemaObject$offsetFilterPipeline, auto_unbox = TRUE, digits = NA))
        self$`offsetFilterPipeline` <- offsetFilterPipelineObject
      }
      if (!is.null(ArraySchemaObject$`domain`)) {
        domainObject <- Domain$new()
        domainObject$fromJSON(jsonlite::toJSON(ArraySchemaObject$domain, auto_unbox = TRUE, digits = NA))
        self$`domain` <- domainObject
      }
      if (!is.null(ArraySchemaObject$`attributes`)) {
        self$`attributes` <- ApiClient$new()$deserializeObj(ArraySchemaObject$`attributes`, "array[Attribute]", loadNamespace("tiledbcloud"))
      }
      if (!is.null(ArraySchemaObject$`allowsDuplicates`)) {
        self$`allowsDuplicates` <- ArraySchemaObject$`allowsDuplicates`
      }
      self
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`uri`)) {
        sprintf(
        '"uri":
          "%s"
                ',
        self$`uri`
        )},
        if (!is.null(self$`version`)) {
        sprintf(
        '"version":
           [%s]
        ',
        paste(unlist(lapply(self$`version`, function(x) paste0('"', x, '"'))), collapse=",")
        )},
        if (!is.null(self$`arrayType`)) {
        sprintf(
        '"arrayType":
        %s
        ',
        jsonlite::toJSON(self$`arrayType`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`tileOrder`)) {
        sprintf(
        '"tileOrder":
        %s
        ',
        jsonlite::toJSON(self$`tileOrder`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`cellOrder`)) {
        sprintf(
        '"cellOrder":
        %s
        ',
        jsonlite::toJSON(self$`cellOrder`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`capacity`)) {
        sprintf(
        '"capacity":
          %d
                ',
        self$`capacity`
        )},
        if (!is.null(self$`coordsFilterPipeline`)) {
        sprintf(
        '"coordsFilterPipeline":
        %s
        ',
        jsonlite::toJSON(self$`coordsFilterPipeline`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`offsetFilterPipeline`)) {
        sprintf(
        '"offsetFilterPipeline":
        %s
        ',
        jsonlite::toJSON(self$`offsetFilterPipeline`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`domain`)) {
        sprintf(
        '"domain":
        %s
        ',
        jsonlite::toJSON(self$`domain`$toJSON(), auto_unbox=TRUE, digits = NA)
        )},
        if (!is.null(self$`attributes`)) {
        sprintf(
        '"attributes":
        [%s]
',
        paste(sapply(self$`attributes`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox=TRUE, digits = NA)), collapse=",")
        )},
        if (!is.null(self$`allowsDuplicates`)) {
        sprintf(
        '"allowsDuplicates":
          "%s"
                ',
        self$`allowsDuplicates`
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(ArraySchemaJson) {
      ArraySchemaObject <- jsonlite::fromJSON(ArraySchemaJson)
      self$`uri` <- ArraySchemaObject$`uri`
      self$`version` <- ApiClient$new()$deserializeObj(ArraySchemaObject$`version`, "array[integer]", loadNamespace("tiledbcloud"))
      self$`arrayType` <- ArrayType$new()$fromJSON(jsonlite::toJSON(ArraySchemaObject$arrayType, auto_unbox = TRUE, digits = NA))
      self$`tileOrder` <- Layout$new()$fromJSON(jsonlite::toJSON(ArraySchemaObject$tileOrder, auto_unbox = TRUE, digits = NA))
      self$`cellOrder` <- Layout$new()$fromJSON(jsonlite::toJSON(ArraySchemaObject$cellOrder, auto_unbox = TRUE, digits = NA))
      self$`capacity` <- ArraySchemaObject$`capacity`
      self$`coordsFilterPipeline` <- FilterPipeline$new()$fromJSON(jsonlite::toJSON(ArraySchemaObject$coordsFilterPipeline, auto_unbox = TRUE, digits = NA))
      self$`offsetFilterPipeline` <- FilterPipeline$new()$fromJSON(jsonlite::toJSON(ArraySchemaObject$offsetFilterPipeline, auto_unbox = TRUE, digits = NA))
      self$`domain` <- Domain$new()$fromJSON(jsonlite::toJSON(ArraySchemaObject$domain, auto_unbox = TRUE, digits = NA))
      self$`attributes` <- ApiClient$new()$deserializeObj(ArraySchemaObject$`attributes`, "array[Attribute]", loadNamespace("tiledbcloud"))
      self$`allowsDuplicates` <- ArraySchemaObject$`allowsDuplicates`
      self
    }
  )
)

