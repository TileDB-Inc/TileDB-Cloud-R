# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title ArrayTaskLog
#'
#' @description ArrayTaskLog Class
#'
#' @format An \code{R6Class} generator object
#'
#' @field array_task_id  character [optional]
#'
#' @field logs  character [optional]
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ArrayTaskLog <- R6::R6Class(
  'ArrayTaskLog',
  public = list(
    `array_task_id` = NULL,
    `logs` = NULL,
    initialize = function(
        `array_task_id`=NULL, `logs`=NULL, ...
    ) {
      local.optional.var <- list(...)
      if (!is.null(`array_task_id`)) {
        stopifnot(is.character(`array_task_id`), length(`array_task_id`) == 1)
        self$`array_task_id` <- `array_task_id`
      }
      if (!is.null(`logs`)) {
        stopifnot(is.character(`logs`), length(`logs`) == 1)
        self$`logs` <- `logs`
      }
    },
    toJSON = function() {
      ArrayTaskLogObject <- list()
      if (!is.null(self$`array_task_id`)) {
        ArrayTaskLogObject[['array_task_id']] <-
          self$`array_task_id`
      }
      if (!is.null(self$`logs`)) {
        ArrayTaskLogObject[['logs']] <-
          self$`logs`
      }

      ArrayTaskLogObject
    },
    fromJSON = function(ArrayTaskLogJson) {
      ArrayTaskLogObject <- jsonlite::fromJSON(ArrayTaskLogJson)
      if (!is.null(ArrayTaskLogObject$`array_task_id`)) {
        self$`array_task_id` <- ArrayTaskLogObject$`array_task_id`
      }
      if (!is.null(ArrayTaskLogObject$`logs`)) {
        self$`logs` <- ArrayTaskLogObject$`logs`
      }
      self
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`array_task_id`)) {
        sprintf(
        '"array_task_id":
          "%s"
                ',
        self$`array_task_id`
        )},
        if (!is.null(self$`logs`)) {
        sprintf(
        '"logs":
          "%s"
                ',
        self$`logs`
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(ArrayTaskLogJson) {
      ArrayTaskLogObject <- jsonlite::fromJSON(ArrayTaskLogJson)
      self$`array_task_id` <- ArrayTaskLogObject$`array_task_id`
      self$`logs` <- ArrayTaskLogObject$`logs`
      self
    }
  )
)

