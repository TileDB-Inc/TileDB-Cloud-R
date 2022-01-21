if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "") {
    Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)
} else {
    if (!file.exists("~/.tiledb/cloud.json")) exit_file("No authentication")
}

library(tiledbcloud)
library(tinytest)

apiClientInstance <- tiledbcloud:::.pkgenv[["apiClientInstance"]]
if (is.null(apiClientInstance)) exit_file("not logged in")

arr <- ArrayApi$new(apiClientInstance)
expect_true(is(arr, "ArrayApi"))

res <- arr$GetArrayMetadata("TileDB-Inc", "quickstart_dense")
expect_true(is(res, "ArrayInfo"))
expect_equal(res$tiledb_uri, "tiledb://TileDB-Inc/quickstart_dense")
expect_equal(res$namespace, "TileDB-Inc")
expect_equal(res$type, "dense")
#print(str(res))


## next ones derived from test_basic.py

ai <- tiledbcloud::ArrayInfo$new("tiledb://TileDB-Inc/quickstart_sparse")
expect_true(is(ai, "ArrayInfo"))

ai <- tiledbcloud::ArrayActivityLog$new("tiledb://TileDB-Inc/quickstart_sparse")
expect_true(is(ai, "ArrayActivityLog"))
