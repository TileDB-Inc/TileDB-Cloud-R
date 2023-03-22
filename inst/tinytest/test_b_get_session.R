# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

userApiInstance <- tiledbcloud:::.pkgenv[["userApiInstance"]]
if (is.null(userApiInstance)) exit_file("not logged in")

res <- userApiInstance$GetSession()
expect_true(is(res, "Token"))
expect_true(!is.null(res$token) && is.character(res$token))

getUTC <- function(x) as.POSIXct(x, tz="UTC", format="%Y-%m-%dT%H:%M:%OS")
issued <- getUTC(res$issued_at)
expires <- getUTC(res$expires_at)
expect_true(inherits(issued, "POSIXct"))
expect_true(inherits(expires, "POSIXct"))
expect_true(as.numeric(difftime(expires, issued, units="hours")) > 6)
