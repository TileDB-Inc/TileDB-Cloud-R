# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

# Local and non-local test files are in separate files. This is to (a) validate
# correct functioning of non-cloud-dependent and cloud-dependent things; (b)
# separate what can be tested without and with cloud credentials.  Let's keep
# this separation of files.

# ----------------------------------------------------------------
library(tinytest)

if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "") {
    Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)
} else {
    if (!file.exists("~/.tiledb/cloud.json")) exit_file("No authentication")
}

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

# ----------------------------------------------------------------
library(tiledbcloud)

# ----------------------------------------------------------------
a <- delayed_sql(
    namespace=namespaceToCharge,
    query="select `rows`, AVG(a) as avg_a from `tiledb://TileDB-Inc/quickstart_dense` GROUP BY `rows`",
    name="rows-query")
o <- compute(a, namespaceToCharge)
expect_equal(names(o), c("avg_a", "rows"))
expect_equal(rownames(o), c("1", "2", "3", "4"))
expect_equal(o[["avg_a"]], c("2.5000", "6.5000", "10.5000", "14.5000"))
expect_equal(o[["rows"]], c(1, 2, 3, 4))

# > str(o)
# 'data.frame':	4 obs. of  2 variables:
#  $ avg_a: chr  "2.5000" "6.5000" "10.5000" "14.5000"
#  $ rows : int  1 2 3 4

# ----------------------------------------------------------------
a <- delayed_generic_udf(
  namespace=namespaceToCharge,
  udf=function(vec, exponent) {
    sum(vec ** exponent)
  },
  args=list(vec=1:10, exponent=3),
  name='my generic udf'
)
o <- compute(a, namespace=namespaceToCharge)
expect_equal(o, 3025)

# ----------------------------------------------------------------
a <- delayed_array_udf(
  namespace=namespaceToCharge,
  array="TileDB-Inc/quickstart_dense",
  udf=function(df) {
    vec <- as.vector(df[["a"]])
    list(min=min(vec), med=median(vec), max=max(vec))
  },
  selectedRanges=list(cbind(1,2), cbind(1,2)),
  attrs=c("a")
)
o <- compute(a, namespace=namespaceToCharge)
expect_equal(o, list(min=1, med=3.5, max=6))

a <- delayed_array_udf(
  namespace=namespaceToCharge,
  array="TileDB-Inc/quickstart_dense",
  udf=function(df) {
    vec <- as.vector(df[["a"]])
    sum(vec ** 3)
  },
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a")
)
o <- compute(a, namespace=namespaceToCharge)
expect_equal(o, 18496)

a <- delayed_array_udf(
  namespace=namespaceToCharge,
  array="TileDB-Inc/quickstart_dense",
  udf=function(df, exponent) {
    vec <- as.vector(df[["a"]])
    sum(vec ** exponent)
  },
  args=list(exponent=3),
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a")
)
o <- compute(a, namespace=namespaceToCharge)
expect_equal(o, 18496)
