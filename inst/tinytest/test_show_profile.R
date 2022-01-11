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
# The result of show_profile() will vary depending on which user runs this
# test.  But we can check essential things, such as whether some fields are
# present and non-empty.

p <- tiledbcloud::user_profile()

expect_equal(length(p$id), 1)
expect_true(nchar(p$id[[1]]) > 0)

expect_equal(length(p$name), 1)
expect_true(nchar(p$name[[1]]) > 0)

expect_equal(length(p$email), 1)
expect_true(nchar(p$email[[1]]) > 0)
