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
udfname <- make_udf_name('udf-registration-test-generic')
myfunc <- function(left, right) {
  paste(left, "<=>", right)
}

# ----------------------------------------------------------------
tiledbcloud::register_udf(namespace=namespaceToCharge, name=udfname, type='generic', func=myfunc)
info <- tiledbcloud::get_udf_info(namespace=namespaceToCharge, name=udfname)
expect_equal(info$name, udfname)

# ----------------------------------------------------------------
registered_udf_name=paste(namespaceToCharge, udfname, sep='/')

result <- tiledbcloud::execute_generic_udf(
  registered_udf_name=registered_udf_name,
  args=list(left="left", right="right"),
  namespace=namespaceToCharge
)

# Deregister the temp name before checking the result, in case of failure,
# so we don't leave temp names dangling.
tiledbcloud::deregister_udf(namespace=namespaceToCharge, name=udfname)

expect_equal(result, "left <=> right")
