#' Group Information
#'
#' Show information about a group on TileDB Cloud.
#'
#' @inheritParams array_info
#' @param name Name of the group
#'
#' @return A list of properties
#' @family {manual-layer functions}
#' @export
group_info <- function(namespace, name) {
  groupApiInstance <- GroupsApi$new(get_api_client_instance())
  resp <- groupApiInstance$GetGroup(namespace, name)

  switch(class(resp)[1],
    ApiResponse = stop(httr::content(resp$response)$message, call. = FALSE),
    GroupInfo = resp$toJSON(),
    stop("Unexpected response type from GetGroup()", call. = FALSE)
  )
}

#' Show listing of groups
#'
#' Returns a dataframe of metadata for all groups that meet the
#' filter applied.
#'
#' Note that this is a paginable API but default params return all results on
#' one call, even hundreds of them.
#'
#' Pagination information is set as an attribute of the returned data frame.
#'
#' @inheritParams list_arrays
#' @param flat logical, if `TRUE`, ignores the nesting of groups and searches
#' all of them
#' @param parent character, search only the children of the groups with this
#' uuid
#'
#' @return A `data.frame` of metadata for all groups in your account that meet
#' the filter applied.
#' @family {manual-layer functions}
#' @export

list_groups <- function (
  public = FALSE,
  shared = FALSE,
  page = NULL,
  per.page = NULL,
  search = NULL,
  namespace = NULL,
  orderby = NULL,
  permissions = NULL,
  tag = NULL,
  exclude.tag = NULL,
  flat = FALSE,
  parent = NULL
) {

  stopifnot(
    is.logical(flat),
    is.null(parent) || is.character(parent)
  )

  if (public && shared) {
    stop("The public and shared arguments must not both be TRUE.")
  }
  apiClientInstance <- get_api_client_instance()
  groupApiInstance <- GroupsApi$new(apiClientInstance)

  groupGetter <- if (public) {
    groupApiInstance$ListPublicGroups
  } else if (shared) {
    groupApiInstance$ListSharedGroups
  } else {
    groupApiInstance$ListOwnedGroups
  }

  resultObject <- groupGetter(
    page,
    per.page,
    search,
    namespace,
    orderby,
    permissions,
    tag,
    exclude.tag,
    flat,
    parent
  )
  response <- resultObject$toJSON()
  groups <- response$groups

  # The tag element contains a list, which needs to be add separately
  group_element_tags <- lapply(groups, getElement, name = "tags")

  # Ensure all groups possess the same set of elements
  group_elements <- setdiff(Reduce(union, lapply(groups, names)), "tags")
  groups <- lapply(groups, getElements, names = group_elements, default = NA)

  # Convert to a data frame and add back the tags
  groups <- do.call("rbind", lapply(groups, as.data.frame))
  groups$tags <- group_element_tags

  structure(groups, pagination_metadata = response$pagination_metadata)
}

#' Register a group on TileDB Cloud
#'
#' @description The underlying group must already exist.
#'
#' @param name Object name in TileDB Cloud. Defaults to the basename of the URI.
#'
#' @family {manual-layer functions}
#' @export
register_group <- function(
  uri,
  name = NULL,
  namespace = NULL,
  description = NULL,
  access_credentials_name = NULL
) {
  groupApiInstance <- GroupsApi$new(get_api_client_instance())

  stopifnot(
    is.character(uri),
    is.null(name) || is.character(name),
    is.null(namespace) || is.character(namespace),
    is.null(description) || is.character(description),
    is.null(access_credentials_name) || is.character(access_credentials_name)
  )

  if (is.null(name)) name <- basename(uri)
  if (is.null(namespace)) namespace <- .get_default_namespace_charged_or_stop()

  group_register <- GroupRegister$new(
    name = name,
    uri = uri,
    description = description,
    access_credentials_name = access_credentials_name
  )

  result <- groupApiInstance$RegisterGroup(
    namespace = namespace,
    array = name,
    group.register = group_register
  )

  # Decode the result, expecting empty string.
  # Update: the response is no longer empty.
  # .get_empty_response_body_or_stop(result)
  invisible("OK")
}
