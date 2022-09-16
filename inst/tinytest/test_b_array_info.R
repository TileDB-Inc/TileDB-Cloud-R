
library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
info <- tiledbcloud::array_info(namespace="TileDB-Inc", arrayname="quickstart_dense")
expect_equal(info$namespace, "TileDB-Inc")
expect_equal(info$name, "quickstart_dense")
expect_equal(info$tiledb_uri, "tiledb://TileDB-Inc/quickstart_dense")
