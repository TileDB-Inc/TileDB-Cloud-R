# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title TokenRequest
#'
#' @description TokenRequest Class
#'
#' @format An \code{R6Class} generator object
#'
#' @field expires  character [optional]
#'
#' @field name  character [optional]
#'
#' @field scope  character [optional]
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
TokenRequest <- R6::R6Class(
  'TokenRequest',
  public = list(
    `expires` = NULL,
    `name` = NULL,
    `scope` = NULL,
    initialize = function(
        `expires`=NULL, `name`=NULL, `scope`='*', ...
    ) {
      local.optional.var <- list(...)
      if (!is.null(`expires`)) {
        stopifnot(is.character(`expires`), length(`expires`) == 1)
        self$`expires` <- `expires`
      }
      if (!is.null(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!is.null(`scope`)) {
        stopifnot(is.character(`scope`), length(`scope`) == 1)
        self$`scope` <- `scope`
      }
    },
    toJSON = function() {
      TokenRequestObject <- list()
      if (!is.null(self$`expires`)) {
        TokenRequestObject[['expires']] <-
          self$`expires`
      }
      if (!is.null(self$`name`)) {
        TokenRequestObject[['name']] <-
          self$`name`
      }
      if (!is.null(self$`scope`)) {
        TokenRequestObject[['scope']] <-
          self$`scope`
      }

      TokenRequestObject
    },
    fromJSON = function(TokenRequestJson) {
      TokenRequestObject <- jsonlite::fromJSON(TokenRequestJson)
      if (!is.null(TokenRequestObject$`expires`)) {
        self$`expires` <- TokenRequestObject$`expires`
      }
      if (!is.null(TokenRequestObject$`name`)) {
        self$`name` <- TokenRequestObject$`name`
      }
      if (!is.null(TokenRequestObject$`scope`)) {
        self$`scope` <- TokenRequestObject$`scope`
      }
      self
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`expires`)) {
        sprintf(
        '"expires":
          "%s"
                ',
        self$`expires`
        )},
        if (!is.null(self$`name`)) {
        sprintf(
        '"name":
          "%s"
                ',
        self$`name`
        )},
        if (!is.null(self$`scope`)) {
        sprintf(
        '"scope":
          "%s"
                ',
        self$`scope`
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(TokenRequestJson) {
      TokenRequestObject <- jsonlite::fromJSON(TokenRequestJson)
      self$`expires` <- TokenRequestObject$`expires`
      self$`name` <- TokenRequestObject$`name`
      self$`scope` <- TokenRequestObject$`scope`
      self
    }
  )
)

