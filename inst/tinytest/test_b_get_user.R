
library(tiledbcloud)
library(tinytest)

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
