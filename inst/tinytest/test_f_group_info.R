# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
info <- group_info(namespace="TileDB-Inc", name = "TileDB_101")
expect_equal(info$namespace, "TileDB-Inc")
expect_equal(info$name, "TileDB_101")

expect_error(
  group_info(namespace="TileDB-Inc", name = "foo"),
  "group not found"
)
