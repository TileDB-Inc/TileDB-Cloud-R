if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "")
    Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)

library(tiledbcloud)
library(tinytest)

api <- tiledbcloud:::.pkgenv[["api"]]

res <- api$GetUser()
expect_true(is.list(res))
expect_true(length(names(res)) >= 13)
expect_equal(res$email, "aws-mvp@tiledb.io")
expect_equal(res$name, "Unit Test")
expect_equal(res$is_valid_email, TRUE)
expect_equal(res$username, "unittest")
expect_equal(res$organizations$username, "unittest")
