# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    tinytest::exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

library(tiledbcloud)
library(tinytest)

S3_BUCKET <- "s3://tiledb-aaron/tiledbcloud-r/tests"
NAMESPACE <- "aaronwolen"

# ----------------------------------------------------------------
cloud_config <- tiledbcloud::configure()
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
if (Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE") != "unittest") {
    exit_file("Skipping unit tests which use resources specific to the TileDB Cloud unittest account")
}

# ----------------------------------------------------------------
make_temp_name <- function(base) {
  sys_time <- floor(as.numeric(Sys.time()))
  rnd_int <- floor(runif(1, min = 100000, max = 999999))
  paste(base, sys_time, rnd_int, sep="_")
}

# ----------------------------------------------------------------
# REGISTER

# Create group with structure
# test-group-0
# ├── test-group-1a
# │  ├── test-array-2a
# │  └── test-array-2b
# └── test-group-1b

base_uri <- sprintf("tiledb://%s/%s", NAMESPACE, S3_BUCKET)

# Create the groups
group0_uri <- tiledb::tiledb_group_create(
  uri = file.path(S3_BUCKET, make_temp_name("test-group-0"))
)
group1a_uri <- tiledb::tiledb_group_create(
  uri = file.path(group0_uri, make_temp_name("test-group-1a"))
)
group1b_uri <- tiledb::tiledb_group_create(
  uri = file.path(group0_uri, make_temp_name("test-group-1b"))
)

# Create the arrays
array2a_uri <- file.path(group1a_uri, make_temp_name("test-array-2a"))
tiledb::fromDataFrame(mtcars, uri = array2a_uri)

array2b_uri <- file.path(group1a_uri, make_temp_name("test-array-2b"))
array2b <- tiledb::fromDataFrame(iris, uri = array2b_uri)

# Add members
grp0 <- tiledb::tiledb_group(group0_uri, type = "WRITE")
tiledb::tiledb_group_add_member(grp0, group1a_uri, relative = FALSE, name = basename(group1a_uri))
tiledb::tiledb_group_add_member(grp0, group1b_uri, relative = FALSE, name = basename(group1b_uri))
tiledb::tiledb_group_close(grp0)

grp1b <- tiledb::tiledb_group(group1b_uri, type = "WRITE")
tiledb::tiledb_group_add_member(grp1b, array2a_uri, relative = FALSE, name = basename(array2a_uri))
tiledb::tiledb_group_add_member(grp1b, array2b_uri, relative = FALSE, name = basename(array2b_uri))
tiledb::tiledb_group_close(grp1b)

# Register the groups
register_group(
  uri = group0_uri,
  name = basename(group0_uri),
  namespace = NAMESPACE,
  description = "Test Description",
)

group_info(NAMESPACE, basename(group0_uri))

# ----------------------------------------------------------------
# DEREGISTER

tiledbcloud::deregister_group(
  uri = group0_uri,
  delete_array = TRUE,
  verbose = TRUE,
  namespace = NAMESPACE,
  name = basename(group0_uri)
)

tiledb::tiledb_vfs_remove_dir(
  sub(paste0("tiledb://", NAMESPACE, "/"), "", group0_uri)
)
