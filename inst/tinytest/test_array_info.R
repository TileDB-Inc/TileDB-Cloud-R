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
# This .pkgenv is managed opaquely by the manual-layer API.
# However, it's nice to consult it as a logged-in check, and
# for consistency with other test files in this package.
apiClientInstance <- tiledbcloud:::.pkgenv[["apiClientInstance"]]
if (is.null(apiClientInstance)) exit_file("not logged in")

# ----------------------------------------------------------------
info <- tiledbcloud::array_info(namespace="TileDB-Inc", arrayname="quickstart_dense")

expect_equal(info$namespace, "TileDB-Inc")
expect_equal(info$name, "quickstart_dense")
expect_equal(info$tiledb_uri, "tiledb://TileDB-Inc/quickstart_dense")
