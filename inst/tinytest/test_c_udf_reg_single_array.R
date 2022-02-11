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
make_udf_name <- function(base) {
  paste(base, floor(as.numeric(Sys.time())), floor(runif(1, min = 100000, max = 999999)), sep="_")
}

# ================================================================
udfname <- make_udf_name('udf-registration-test-single-array')

myfunc <- function(df, attrname, exponent) {
  vec <- as.vector(df[[attrname]])
  sum(vec ** exponent)
}

tiledbcloud::register_udf(namespace=namespaceToCharge, name=udfname, type='single_array', func=myfunc)

Sys.sleep(2)

info <- tiledbcloud::get_udf_info(namespace=namespaceToCharge, name=udfname)
expect_equal(info$name, udfname)

Sys.sleep(2)

tiledbcloud::update_udf_info(namespace=namespaceToCharge, name=udfname, type='single_array', func=myfunc, tags=list("testing", "udf", "upload"), readme='Here is the README text', version='2.0')

Sys.sleep(2)

info <- tiledbcloud::get_udf_info(namespace=namespaceToCharge, name=udfname)
expect_equal(info$name, udfname)
expect_equal(info$readme, 'Here is the README text')
# Written as list(...), read back as c(...) -- this is expected.
expect_equal(info$tags, c("testing", "udf", "upload"))

# ----------------------------------------------------------------
registered_udf_name=paste(namespaceToCharge, udfname, sep='/')
result <- tiledbcloud::execute_array_udf(
  array="TileDB-Inc/quickstart_dense",
  registered_udf_name=registered_udf_name,
  args=list(attrname="a", exponent=2),
  selectedRanges=list(cbind(1,2), cbind(1,2)),
  attrs=c("a"),
  namespace=namespaceToCharge
)

# Deregister the temp name before checking the result, in case of failure,
# so we don't leave temp names dangling.
tiledbcloud::deregister_udf(namespace=namespaceToCharge, name=udfname)

expect_equal(result, 66)
