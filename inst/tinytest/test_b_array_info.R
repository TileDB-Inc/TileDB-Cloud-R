
library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
info <- tiledbcloud::array_info(namespace="TileDB-Inc", arrayname="quickstart_dense")
expect_equal(info$namespace, "TileDB-Inc")
expect_equal(info$name, "quickstart_dense")
# 2023-03-22 this is now:
# tiledb://TileDB-Inc/2d6e7def-851e-4832-ae92-202af1f6940d
# expect_equal(info$tiledb_uri, "tiledb://TileDB-Inc/quickstart_dense")
