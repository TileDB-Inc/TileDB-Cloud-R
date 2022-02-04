# Splits input of the form "tiledb://foo/bar" or "foo/bar" into namespace="foo" and name="bar".
.split_uri <- function(input) {
  no_prefix <- sub("^tiledb://", "", input)
  fields <- strsplit(no_prefix, split="/")
  if (length(fields[[1]]) != 2) {
    stop('URI input must be of form "tiledb://namespace/name", or "namespace/name"; got ', input)
  }
  list(namespace=fields[[1]][[1]], name=fields[[1]][[2]])
}

.check_openapi_enum <- function(name, value, acceptable_values) {
  if ((length(value) != 1L) || (!value %in% acceptable_values)) {
    stop("Use one of the valid values for ",
         name,
         ": ",
         paste0(acceptable_values, collapse = ", "))
  }
}
