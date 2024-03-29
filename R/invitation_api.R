# TileDB Storage Platform API
#
# TileDB Storage Platform REST API
#
# The version of the OpenAPI document: 2.2.19
# 
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title Invitation operations
#' @description tiledbcloud.Invitation
#' @format An \code{R6Class} generator object
#' @field apiClient Handles the client-server communication.
#'
#' @section Methods:
#' \describe{
#' \strong{ AcceptInvitation } \emph{  }
#' Accepts invitation
#'
#' \itemize{
#' \item \emph{ @param } invitation character
#'
#'
#' \item status code : 204 | Invitation was accepted successfully
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | Could not find invitation identifier
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | error response
#'
#' \item return type : Error 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ CancelJoinOrganization } \emph{  }
#' Cancels join organization invitation
#'
#' \itemize{
#' \item \emph{ @param } invitation character
#' \item \emph{ @param } organization character
#'
#'
#' \item status code : 204 | Invitation cancelled successfully
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | No invitation was found to cancel
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | error response
#'
#' \item return type : Error 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ CancelShareArrayByInvite } \emph{  }
#' Cancels array sharing invitation
#'
#' \itemize{
#' \item \emph{ @param } namespace character
#' \item \emph{ @param } invitation character
#' \item \emph{ @param } array character
#'
#'
#' \item status code : 204 | Invitation cancelled successfully
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | No invitation was found to cancel
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | error response
#'
#' \item return type : Error 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ FetchInvitations } \emph{  }
#' Fetch a list of invitations
#'
#' \itemize{
#' \item \emph{ @param } organization character
#' \item \emph{ @param } array character
#' \item \emph{ @param } start integer
#' \item \emph{ @param } end integer
#' \item \emph{ @param } page integer
#' \item \emph{ @param } per.page integer
#' \item \emph{ @param } type character
#' \item \emph{ @param } status character
#' \item \emph{ @param } orderby character
#' \item \emph{ @returnType } \link{InvitationData} \cr
#'
#'
#' \item status code : 200 | List of invitations and pagination metadata
#'
#' \item return type : InvitationData 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | error response
#'
#' \item return type : Error 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ JoinOrganization } \emph{  }
#' Sends email to multiple recipients with joining information regarding an organization
#'
#' \itemize{
#' \item \emph{ @param } organization character
#' \item \emph{ @param } email.invite \link{InvitationOrganizationJoinEmail}
#'
#'
#' \item status code : 204 | Email sent successfully to user for email confirmation link
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | Could not reach one or more recipients
#'
#' \item return type : InvitationOrganizationJoinEmail 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | error response
#'
#' \item return type : Error 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ ShareArrayByInvite } \emph{  }
#' Sends email to multiple recipients with sharing information regarding an array
#'
#' \itemize{
#' \item \emph{ @param } namespace character
#' \item \emph{ @param } array character
#' \item \emph{ @param } email.invite \link{InvitationArrayShareEmail}
#'
#'
#' \item status code : 204 | Email sent successfully to user for email confirmation link
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | Could not reach one or more recipients
#'
#' \item return type : InvitationArrayShareEmail 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | error response
#'
#' \item return type : Error 
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' }
#'
#'
#' @examples
#' \dontrun{
#' ####################  AcceptInvitation  ####################
#'
#' library(tiledbcloud)
#' var.invitation <- 'invitation_example' # character | the ID of invitation about to be accepted
#'
#' api.instance <- InvitationApi$new()
#'
#' #Configure API key authorization: ApiKeyAuth
#' api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
#'
#' #Configure HTTP basic authorization: BasicAuth
#' # provide your username in the user-serial format
#' api.instance$apiClient$username <- '<user-serial>'; 
#' # provide your api key generated using the developer portal
#' api.instance$apiClient$password <- '<api_key>';
#'
#' result <- api.instance$AcceptInvitation(var.invitation)
#'
#'
#' ####################  CancelJoinOrganization  ####################
#'
#' library(tiledbcloud)
#' var.invitation <- 'invitation_example' # character | the ID of invitation about to be cancelled
#' var.organization <- 'organization_example' # character | name or UUID of organization
#'
#' api.instance <- InvitationApi$new()
#'
#' #Configure API key authorization: ApiKeyAuth
#' api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
#'
#' #Configure HTTP basic authorization: BasicAuth
#' # provide your username in the user-serial format
#' api.instance$apiClient$username <- '<user-serial>'; 
#' # provide your api key generated using the developer portal
#' api.instance$apiClient$password <- '<api_key>';
#'
#' result <- api.instance$CancelJoinOrganization(var.invitation, var.organization)
#'
#'
#' ####################  CancelShareArrayByInvite  ####################
#'
#' library(tiledbcloud)
#' var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
#' var.invitation <- 'invitation_example' # character | the ID of invitation about to be cancelled
#' var.array <- 'array_example' # character | name/uri of array that is url-encoded
#'
#' api.instance <- InvitationApi$new()
#'
#' #Configure API key authorization: ApiKeyAuth
#' api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
#'
#' #Configure HTTP basic authorization: BasicAuth
#' # provide your username in the user-serial format
#' api.instance$apiClient$username <- '<user-serial>'; 
#' # provide your api key generated using the developer portal
#' api.instance$apiClient$password <- '<api_key>';
#'
#' result <- api.instance$CancelShareArrayByInvite(var.namespace, var.invitation, var.array)
#'
#'
#' ####################  FetchInvitations  ####################
#'
#' library(tiledbcloud)
#' var.organization <- 'organization_example' # character | name or ID of organization to filter
#' var.array <- 'array_example' # character | name/uri of array that is url-encoded to filter
#' var.start <- 56 # integer | start time for tasks to filter by
#' var.end <- 56 # integer | end time for tasks to filter by
#' var.page <- 56 # integer | pagination offset
#' var.per.page <- 56 # integer | pagination limit
#' var.type <- 'type_example' # character | invitation type, \"ARRAY_SHARE\", \"JOIN_ORGANIZATION\"
#' var.status <- 'status_example' # character | Filter to only return \"PENDING\", \"ACCEPTED\"
#' var.orderby <- 'orderby_example' # character | sort by which field valid values include timestamp, array_name, organization_name
#'
#' api.instance <- InvitationApi$new()
#'
#' #Configure API key authorization: ApiKeyAuth
#' api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
#'
#' #Configure HTTP basic authorization: BasicAuth
#' # provide your username in the user-serial format
#' api.instance$apiClient$username <- '<user-serial>'; 
#' # provide your api key generated using the developer portal
#' api.instance$apiClient$password <- '<api_key>';
#'
#' result <- api.instance$FetchInvitations(organization=var.organization, array=var.array, start=var.start, end=var.end, page=var.page, per.page=var.per.page, type=var.type, status=var.status, orderby=var.orderby)
#'
#'
#' ####################  JoinOrganization  ####################
#'
#' library(tiledbcloud)
#' var.organization <- 'organization_example' # character | name or UUID of organization
#' var.email.invite <- InvitationOrganizationJoinEmail$new() # InvitationOrganizationJoinEmail | list of email recipients
#'
#' api.instance <- InvitationApi$new()
#'
#' #Configure API key authorization: ApiKeyAuth
#' api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
#'
#' #Configure HTTP basic authorization: BasicAuth
#' # provide your username in the user-serial format
#' api.instance$apiClient$username <- '<user-serial>'; 
#' # provide your api key generated using the developer portal
#' api.instance$apiClient$password <- '<api_key>';
#'
#' result <- api.instance$JoinOrganization(var.organization, var.email.invite)
#'
#'
#' ####################  ShareArrayByInvite  ####################
#'
#' library(tiledbcloud)
#' var.namespace <- 'namespace_example' # character | namespace array is in (an organization name or user's username)
#' var.array <- 'array_example' # character | name/uri of array that is url-encoded
#' var.email.invite <- InvitationArrayShareEmail$new() # InvitationArrayShareEmail | list of email recipients
#'
#' api.instance <- InvitationApi$new()
#'
#' #Configure API key authorization: ApiKeyAuth
#' api.instance$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- 'TODO_YOUR_API_KEY';
#'
#' #Configure HTTP basic authorization: BasicAuth
#' # provide your username in the user-serial format
#' api.instance$apiClient$username <- '<user-serial>'; 
#' # provide your api key generated using the developer portal
#' api.instance$apiClient$password <- '<api_key>';
#'
#' result <- api.instance$ShareArrayByInvite(var.namespace, var.array, var.email.invite)
#'
#'
#' }
#' @importFrom R6 R6Class
#' @importFrom base64enc base64encode
#' @export
InvitationApi <- R6::R6Class(
  'InvitationApi',
  public = list(
    apiClient = NULL,
    initialize = function(apiClient){
      if (!missing(apiClient)) {
        self$apiClient <- apiClient
      }
      else {
        self$apiClient <- ApiClient$new()
      }
    },
    AcceptInvitation = function(invitation, ...){
      apiResponse <- self$AcceptInvitationWithHttpInfo(invitation, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        apiResponse
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    AcceptInvitationWithHttpInfo = function(invitation, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`invitation`)) {
        stop("Missing required parameter `invitation`.")
      }

      body <- NULL
      urlPath <- "/invitations/{invitation}"
      if (!missing(`invitation`)) {
        urlPath <- gsub(paste0("\\{", "invitation", "\\}"), URLencode(as.character(`invitation`), reserved = TRUE), urlPath)
      }

      # API key authentication
      if ("X-TILEDB-REST-API-KEY" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]) > 0) {
        headerParams['X-TILEDB-REST-API-KEY'] <- paste(unlist(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]), collapse='')
      }
      # HTTP basic auth
      headerParams['Authorization'] <- paste("Basic", base64enc::base64encode(charToRaw(paste(self$apiClient$username, self$apiClient$password, sep=":"))))

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        ApiResponse$new(paste("Server returned " , httr::status_code(resp) , " response status code."), resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    CancelJoinOrganization = function(invitation, organization, ...){
      apiResponse <- self$CancelJoinOrganizationWithHttpInfo(invitation, organization, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        apiResponse
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    CancelJoinOrganizationWithHttpInfo = function(invitation, organization, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`invitation`)) {
        stop("Missing required parameter `invitation`.")
      }

      if (missing(`organization`)) {
        stop("Missing required parameter `organization`.")
      }

      body <- NULL
      urlPath <- "/invitations/{invitation}/{organization}/join"
      if (!missing(`invitation`)) {
        urlPath <- gsub(paste0("\\{", "invitation", "\\}"), URLencode(as.character(`invitation`), reserved = TRUE), urlPath)
      }

      if (!missing(`organization`)) {
        urlPath <- gsub(paste0("\\{", "organization", "\\}"), URLencode(as.character(`organization`), reserved = TRUE), urlPath)
      }

      # API key authentication
      if ("X-TILEDB-REST-API-KEY" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]) > 0) {
        headerParams['X-TILEDB-REST-API-KEY'] <- paste(unlist(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]), collapse='')
      }
      # HTTP basic auth
      headerParams['Authorization'] <- paste("Basic", base64enc::base64encode(charToRaw(paste(self$apiClient$username, self$apiClient$password, sep=":"))))

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        ApiResponse$new(paste("Server returned " , httr::status_code(resp) , " response status code."), resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    CancelShareArrayByInvite = function(namespace, invitation, array, ...){
      apiResponse <- self$CancelShareArrayByInviteWithHttpInfo(namespace, invitation, array, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        apiResponse
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    CancelShareArrayByInviteWithHttpInfo = function(namespace, invitation, array, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`namespace`)) {
        stop("Missing required parameter `namespace`.")
      }

      if (missing(`invitation`)) {
        stop("Missing required parameter `invitation`.")
      }

      if (missing(`array`)) {
        stop("Missing required parameter `array`.")
      }

      body <- NULL
      urlPath <- "/invitations/{invitation}/{namespace}/{array}/share"
      if (!missing(`namespace`)) {
        urlPath <- gsub(paste0("\\{", "namespace", "\\}"), URLencode(as.character(`namespace`), reserved = TRUE), urlPath)
      }

      if (!missing(`invitation`)) {
        urlPath <- gsub(paste0("\\{", "invitation", "\\}"), URLencode(as.character(`invitation`), reserved = TRUE), urlPath)
      }

      if (!missing(`array`)) {
        urlPath <- gsub(paste0("\\{", "array", "\\}"), URLencode(as.character(`array`), reserved = TRUE), urlPath)
      }

      # API key authentication
      if ("X-TILEDB-REST-API-KEY" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]) > 0) {
        headerParams['X-TILEDB-REST-API-KEY'] <- paste(unlist(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]), collapse='')
      }
      # HTTP basic auth
      headerParams['Authorization'] <- paste("Basic", base64enc::base64encode(charToRaw(paste(self$apiClient$username, self$apiClient$password, sep=":"))))

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        ApiResponse$new(paste("Server returned " , httr::status_code(resp) , " response status code."), resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    FetchInvitations = function(organization=NULL, array=NULL, start=NULL, end=NULL, page=NULL, per.page=NULL, type=NULL, status=NULL, orderby=NULL, ...){
      apiResponse <- self$FetchInvitationsWithHttpInfo(organization, array, start, end, page, per.page, type, status, orderby, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        apiResponse
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    FetchInvitationsWithHttpInfo = function(organization=NULL, array=NULL, start=NULL, end=NULL, page=NULL, per.page=NULL, type=NULL, status=NULL, orderby=NULL, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      queryParams['organization'] <- organization

      queryParams['array'] <- array

      queryParams['start'] <- start

      queryParams['end'] <- end

      queryParams['page'] <- page

      queryParams['per_page'] <- per.page

      queryParams['type'] <- type

      queryParams['status'] <- status

      queryParams['orderby'] <- orderby

      body <- NULL
      urlPath <- "/invitations"
      # API key authentication
      if ("X-TILEDB-REST-API-KEY" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]) > 0) {
        headerParams['X-TILEDB-REST-API-KEY'] <- paste(unlist(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]), collapse='')
      }
      # HTTP basic auth
      headerParams['Authorization'] <- paste("Basic", base64enc::base64encode(charToRaw(paste(self$apiClient$username, self$apiClient$password, sep=":"))))

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        deserializedRespObj <- tryCatch(
          self$apiClient$deserialize(resp, "InvitationData", loadNamespace("tiledbcloud")),
          error = function(e){
             stop("Failed to deserialize response")
          }
        )
        ApiResponse$new(deserializedRespObj, resp)
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        ApiResponse$new(paste("Server returned " , httr::status_code(resp) , " response status code."), resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    JoinOrganization = function(organization, email.invite, ...){
      apiResponse <- self$JoinOrganizationWithHttpInfo(organization, email.invite, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        apiResponse
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    JoinOrganizationWithHttpInfo = function(organization, email.invite, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`organization`)) {
        stop("Missing required parameter `organization`.")
      }

      if (missing(`email.invite`)) {
        stop("Missing required parameter `email.invite`.")
      }

      if (!missing(`email.invite`)) {
        body <- `email.invite`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/invitations/{organization}/join"
      if (!missing(`organization`)) {
        urlPath <- gsub(paste0("\\{", "organization", "\\}"), URLencode(as.character(`organization`), reserved = TRUE), urlPath)
      }

      # API key authentication
      if ("X-TILEDB-REST-API-KEY" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]) > 0) {
        headerParams['X-TILEDB-REST-API-KEY'] <- paste(unlist(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]), collapse='')
      }
      # HTTP basic auth
      headerParams['Authorization'] <- paste("Basic", base64enc::base64encode(charToRaw(paste(self$apiClient$username, self$apiClient$password, sep=":"))))

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        ApiResponse$new(paste("Server returned " , httr::status_code(resp) , " response status code."), resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    ShareArrayByInvite = function(namespace, array, email.invite, ...){
      apiResponse <- self$ShareArrayByInviteWithHttpInfo(namespace, array, email.invite, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        apiResponse
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    ShareArrayByInviteWithHttpInfo = function(namespace, array, email.invite, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`namespace`)) {
        stop("Missing required parameter `namespace`.")
      }

      if (missing(`array`)) {
        stop("Missing required parameter `array`.")
      }

      if (missing(`email.invite`)) {
        stop("Missing required parameter `email.invite`.")
      }

      if (!missing(`email.invite`)) {
        body <- `email.invite`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/invitations/{namespace}/{array}/share"
      if (!missing(`namespace`)) {
        urlPath <- gsub(paste0("\\{", "namespace", "\\}"), URLencode(as.character(`namespace`), reserved = TRUE), urlPath)
      }

      if (!missing(`array`)) {
        urlPath <- gsub(paste0("\\{", "array", "\\}"), URLencode(as.character(`array`), reserved = TRUE), urlPath)
      }

      # API key authentication
      if ("X-TILEDB-REST-API-KEY" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]) > 0) {
        headerParams['X-TILEDB-REST-API-KEY'] <- paste(unlist(self$apiClient$apiKeys["X-TILEDB-REST-API-KEY"]), collapse='')
      }
      # HTTP basic auth
      headerParams['Authorization'] <- paste("Basic", base64enc::base64encode(charToRaw(paste(self$apiClient$username, self$apiClient$password, sep=":"))))

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 300 && httr::status_code(resp) <= 399) {
        ApiResponse$new(paste("Server returned " , httr::status_code(resp) , " response status code."), resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    }
  )
)
