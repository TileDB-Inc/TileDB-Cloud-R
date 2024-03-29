# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

userApiInstance <- tiledbcloud:::.pkgenv[["userApiInstance"]]
if (is.null(userApiInstance)) exit_file("not logged in")

res <- user_profile()
expect_true(is.list(res))
expect_true(length(names(res)) >= 13)
expect_equal(res$is_valid_email, TRUE)
if (!is.null(res$email)) {
  if (res$email == "aws-mvp@tiledb.io") {
      # local environment variable can get in the way while developing
      expect_equal(res$email, "aws-mvp@tiledb.io")
      expect_equal(res$name, "Unit Test")
      expect_equal(res$username, "unittest")
      expect_equal(res$organizations$username, "unittest")
  }
}
