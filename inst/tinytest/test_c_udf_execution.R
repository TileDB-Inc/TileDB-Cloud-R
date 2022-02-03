if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "") {
    Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)
} else {
    if (!file.exists("~/.tiledb/cloud.json")) exit_file("No authentication")
}

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
# Generic UDF, no args
myfunc <- function(x=50:54, y=70:74) { x + y }
result <- tiledbcloud::execute_generic_udf(namespace=namespaceToCharge, udf=myfunc)
expect_equal(result, c(120, 122, 124, 126, 128))

# ----------------------------------------------------------------
# Generic UDF, with args
myfunc <- function(x, y) { x + y }
myargs <- list(100:104, 200:204)
result <- tiledbcloud::execute_generic_udf(namespace=namespaceToCharge, udf=myfunc, args=myargs)
expect_equal(result, c(300, 302, 304, 306, 308))

# ----------------------------------------------------------------
# Generic UDF, with result_format

myfunc <- function(x, y) { x + y }
myargs <- list(100:104, 200:204)
result <- tiledbcloud::execute_generic_udf(namespace=namespaceToCharge, udf=myfunc, args=myargs, result_format='json')
expect_equal(result, c(300, 302, 304, 306, 308))

myfunc <- function(x, y) { x + y }
myargs <- list(100:104, 200:204)
result <- tiledbcloud::execute_generic_udf(namespace=namespaceToCharge, udf=myfunc, args=myargs, result_format='arrow')
# Arrow result is of type dataframe, so we pull out the 'result' slot
expect_equal(result$result, c(300, 302, 304, 306, 308))

# ----------------------------------------------------------------
# Array UDF, no args, dense
myfunc <- function(df) {
  vec <- as.vector(df[["a"]])
  list(min=min(vec), med=median(vec), max=max(vec))
}
result <- tiledbcloud::execute_array_udf(
  namespace=namespaceToCharge,
  array="TileDB-Inc/quickstart_dense",
  udf=myfunc,
  selectedRanges=list(cbind(1,2), cbind(1,2)),
  attrs=c("a")
)
expect_equal(result, list(min=1, med=3.5, max=6))

# ----------------------------------------------------------------
# Array UDF, sparse, no args
myfunc <- function(df) {
  vec <- as.vector(df[["a"]])
  list(min=min(vec), med=median(vec), max=max(vec))
}
result <- tiledbcloud::execute_array_udf(
  namespace=namespaceToCharge,
  array="TileDB-Inc/quickstart_sparse",
  udf=myfunc,
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a")
)
expect_equal(result, list(min=1, med=2, max=3))

# ----------------------------------------------------------------
# Array UDF, dense, with args
array_name <- "TileDB-Inc/quickstart_dense"
myfunc <- function(df, exponent) {
  vec <- as.vector(df[["a"]])
  sum(vec) ** exponent
}
selectedRanges <- list(cbind(1,4), cbind(1,4))
attrs <- c("a")

result <- tiledbcloud::execute_array_udf(
  namespace=namespaceToCharge,
  array=array_name,
  udf=myfunc,
  selectedRanges=selectedRanges,
  attrs=attrs,
  args=list(exponent=2)
)
expect_equal(result, 18496)

result <- tiledbcloud::execute_array_udf(
  namespace=namespaceToCharge,
  array=array_name,
  udf=myfunc,
  selectedRanges=selectedRanges,
  attrs=attrs,
  args=list(exponent=3)
)
expect_equal(result, 2515456)

result <- tiledbcloud::execute_array_udf(
  namespace=namespaceToCharge,
  array=array_name,
  udf=myfunc,
  selectedRanges=selectedRanges,
  attrs=attrs,
  args=list(exponent=3),
  result_format='json'
)
expect_equal(result, 2515456)

result <- tiledbcloud::execute_array_udf(
  namespace=namespaceToCharge,
  array=array_name,
  udf=myfunc,
  selectedRanges=selectedRanges,
  attrs=attrs,
  args=list(exponent=3),
  result_format='arrow'
)
# Arrow result is of type dataframe, so we pull out the 'result' slot
expect_equal(result$result, 2515456)

# ----------------------------------------------------------------
# TODO: put this into TileDB-Inc namespace
# myfunc <- function(df) {
#   vec1 <- as.vector(df$bill_length_mm)
#   vec2 <- as.vector(df$body_mass_g)
#   lm.fit(cbind(1, vec2), vec1)$coefficients
# }
# result <- tiledbcloud::execute_array_udf(
#     namespace=namespaceToCharge,
#     array="tiledb://johnkerl/palmer_penguins2",
#     udf=myfunc,
#     selectedRanges=list(cbind("A", "Z"), cbind(2007,2009)),
#     attrs=list("bill_length_mm", "body_mass_g")
# )
# expect_equal(result, c(27.15072200, vec2=0.00400329))
