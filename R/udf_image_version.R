# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title UDFImageVersion
#'
#' @description UDFImageVersion Class
#'
#' @format An \code{R6Class} generator object
#'
#' @field id  character [optional]
#'
#' @field name  character [optional]
#'
#' @field udf_image_uuid  character [optional]
#'
#' @field docker_image  character [optional]
#'
#' @field version  numeric [optional]
#'
#' @field default  character [optional]
#'
#' @field latest  character [optional]
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UDFImageVersion <- R6::R6Class(
  'UDFImageVersion',
  public = list(
    `id` = NULL,
    `name` = NULL,
    `udf_image_uuid` = NULL,
    `docker_image` = NULL,
    `version` = NULL,
    `default` = NULL,
    `latest` = NULL,
    initialize = function(
        `id`=NULL, `name`=NULL, `udf_image_uuid`=NULL, `docker_image`=NULL, `version`=NULL, `default`=NULL, `latest`=NULL, ...
    ) {
      local.optional.var <- list(...)
      if (!is.null(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!is.null(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!is.null(`udf_image_uuid`)) {
        stopifnot(is.character(`udf_image_uuid`), length(`udf_image_uuid`) == 1)
        self$`udf_image_uuid` <- `udf_image_uuid`
      }
      if (!is.null(`docker_image`)) {
        stopifnot(is.character(`docker_image`), length(`docker_image`) == 1)
        self$`docker_image` <- `docker_image`
      }
      if (!is.null(`version`)) {
        self$`version` <- `version`
      }
      if (!is.null(`default`)) {
        self$`default` <- `default`
      }
      if (!is.null(`latest`)) {
        self$`latest` <- `latest`
      }
    },
    toJSON = function() {
      UDFImageVersionObject <- list()
      if (!is.null(self$`id`)) {
        UDFImageVersionObject[['id']] <-
          self$`id`
      }
      if (!is.null(self$`name`)) {
        UDFImageVersionObject[['name']] <-
          self$`name`
      }
      if (!is.null(self$`udf_image_uuid`)) {
        UDFImageVersionObject[['udf_image_uuid']] <-
          self$`udf_image_uuid`
      }
      if (!is.null(self$`docker_image`)) {
        UDFImageVersionObject[['docker_image']] <-
          self$`docker_image`
      }
      if (!is.null(self$`version`)) {
        UDFImageVersionObject[['version']] <-
          self$`version`
      }
      if (!is.null(self$`default`)) {
        UDFImageVersionObject[['default']] <-
          self$`default`
      }
      if (!is.null(self$`latest`)) {
        UDFImageVersionObject[['latest']] <-
          self$`latest`
      }

      UDFImageVersionObject
    },
    fromJSON = function(UDFImageVersionJson) {
      UDFImageVersionObject <- jsonlite::fromJSON(UDFImageVersionJson)
      if (!is.null(UDFImageVersionObject$`id`)) {
        self$`id` <- UDFImageVersionObject$`id`
      }
      if (!is.null(UDFImageVersionObject$`name`)) {
        self$`name` <- UDFImageVersionObject$`name`
      }
      if (!is.null(UDFImageVersionObject$`udf_image_uuid`)) {
        self$`udf_image_uuid` <- UDFImageVersionObject$`udf_image_uuid`
      }
      if (!is.null(UDFImageVersionObject$`docker_image`)) {
        self$`docker_image` <- UDFImageVersionObject$`docker_image`
      }
      if (!is.null(UDFImageVersionObject$`version`)) {
        self$`version` <- UDFImageVersionObject$`version`
      }
      if (!is.null(UDFImageVersionObject$`default`)) {
        self$`default` <- UDFImageVersionObject$`default`
      }
      if (!is.null(UDFImageVersionObject$`latest`)) {
        self$`latest` <- UDFImageVersionObject$`latest`
      }
      self
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`id`)) {
        sprintf(
        '"id":
          "%s"
                ',
        self$`id`
        )},
        if (!is.null(self$`name`)) {
        sprintf(
        '"name":
          "%s"
                ',
        self$`name`
        )},
        if (!is.null(self$`udf_image_uuid`)) {
        sprintf(
        '"udf_image_uuid":
          "%s"
                ',
        self$`udf_image_uuid`
        )},
        if (!is.null(self$`docker_image`)) {
        sprintf(
        '"docker_image":
          "%s"
                ',
        self$`docker_image`
        )},
        if (!is.null(self$`version`)) {
        sprintf(
        '"version":
          %d
                ',
        self$`version`
        )},
        if (!is.null(self$`default`)) {
        sprintf(
        '"default":
          "%s"
                ',
        self$`default`
        )},
        if (!is.null(self$`latest`)) {
        sprintf(
        '"latest":
          "%s"
                ',
        self$`latest`
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(UDFImageVersionJson) {
      UDFImageVersionObject <- jsonlite::fromJSON(UDFImageVersionJson)
      self$`id` <- UDFImageVersionObject$`id`
      self$`name` <- UDFImageVersionObject$`name`
      self$`udf_image_uuid` <- UDFImageVersionObject$`udf_image_uuid`
      self$`docker_image` <- UDFImageVersionObject$`docker_image`
      self$`version` <- UDFImageVersionObject$`version`
      self$`default` <- UDFImageVersionObject$`default`
      self$`latest` <- UDFImageVersionObject$`latest`
      self
    }
  )
)

