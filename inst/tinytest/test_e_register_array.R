# ================================================================
cat("\n")
cat ("ENTER inst/tinytest/test_e_register_array.R\n")
# ================================================================

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

cat ("  inst/tinytest/test_e_register_array.R IMPORTS\n")
library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
cat ("  inst/tinytest/test_e_register_array.R CONFIGURE\n")
cloud_config <- tiledbcloud::configure()
cat ("  inst/tinytest/test_e_register_array.R LOGGED_IN?\n")
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
make_temp_array_name <- function(base) {
  paste(base, floor(as.numeric(Sys.time())), floor(runif(1, min = 100000, max = 999999)), sep="_")
}

# ----------------------------------------------------------------
# REGISTER
array_name <- make_temp_array_name('array-registration-test')
storage_uri <- 's3://tiledb-unittest/data/palmer_penguins2'

cat ("\n  inst/tinytest/test_e_register_array.R BEFORE REGISTER\n")
tiledbcloud::register_array(array_name=array_name, uri=storage_uri, description='Test Description', namespace=namespaceToCharge)
cat ("\n  inst/tinytest/test_e_register_array.R AFTER  REGISTER\n")

# ----------------------------------------------------------------
# READ

config <- tiledb::tiledb_config()
config["rest.server_address"] <- cloud_config[["host"]]
config["rest.token"]          <- cloud_config[["token"]]
ctx <- tiledb::tiledb_ctx(config)

array_uri <- paste0('tiledb://', namespaceToCharge, '/', array_name, ctx=ctx)

cat ("\n  inst/tinytest/test_e_register_array.R BEFORE READ ARRAY\n")
arr <- tiledb::tiledb_array(array_uri, query_type="READ", as.data.frame=TRUE)
cat ("\n  inst/tinytest/test_e_register_array.R AFTER  READ ARRAY\n")
expect_equal(length(arr[]), 8)

# ----------------------------------------------------------------
# DEREGISTER

cat ("\n  inst/tinytest/test_e_register_array.R BEFORE DEREGISTER\n")
tiledbcloud::deregister_array(array_name=array_name, namespace=namespaceToCharge)
cat ("\n  inst/tinytest/test_e_register_array.R AFTER  DEREGISTER\n")

# ================================================================
cat ("EXIT inst/tinytest/test_e_register_array.R\n")
# ================================================================
