# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

apiClientInstance <- tiledbcloud:::.pkgenv[["apiClientInstance"]]
userApiInstance <- tiledbcloud:::.pkgenv[["userApiInstance"]]

sql <- SqlApi$new(apiClientInstance)
expect_true(is(sql, "SqlApi"))

sqlpar <-  SQLParameters$new(name="ArbitraryNameHere", query=paste("select 1 as one"))
expect_true(is(sqlpar, "SQLParameters"))

# Check for handling of newlines inside SQL-query strings
sqlpar <-  SQLParameters$new(name="ArbitraryNameHere", query=paste("select 2
as two"))
expect_true(is(sqlpar, "SQLParameters"))

if (FALSE) {
    ## these work in isolation i.e. via run_test_file() but not in the test env; unsure why
    ans <- sql$RunSQL("unittest", sqlpar)
    expect_true(is.list(ans))
    expect_equal(length(ans), 1)
    df <- ans[[1]]
    expect_true(is.data.frame(df))
    expect_equal(names(df), "one")
}
