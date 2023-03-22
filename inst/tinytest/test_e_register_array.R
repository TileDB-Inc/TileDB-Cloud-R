
if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
make_temp_array_name <- function(base) {
  paste(base, floor(as.numeric(Sys.time())), floor(runif(1, min = 100000, max = 999999)), sep="_")
}

# ----------------------------------------------------------------
# REGISTER
array_name <- make_temp_array_name('array-registration-test')
storage_uri <- 's3://tiledb-unittest/data/palmer_penguins2'

tiledbcloud::register_array(array_name=array_name, uri=storage_uri, description='Test Description', namespace=namespaceToCharge)

# ----------------------------------------------------------------
# READ

# Here we access username and password as environment variables
config <- tiledb::tiledb_config()
config["rest.server_address"] <- Sys.getenv("TILEDB_REST_HOST")     ## wut
config["rest.username"]       <- Sys.getenv("TILEDB_REST_USERNAME")
config["rest.password"]       <- Sys.getenv("TILEDB_REST_PASSWORD")
ctx <- tiledb::tiledb_ctx(config)

array_uri <- paste0('tiledb://', namespaceToCharge, '/', array_name)

arr <- tiledb::tiledb_array(array_uri, query_type="READ", as.data.frame=TRUE)
expect_equal(length(arr[]), 8)

# ----------------------------------------------------------------
# DEREGISTER

tiledbcloud::deregister_array(array_name=array_name, namespace=namespaceToCharge)
