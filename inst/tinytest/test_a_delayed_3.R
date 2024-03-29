# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
# This tests our _understanding_ of the future package before we begin
# to put it into use in the DAG logic.
future::plan(future::multisession)
s <- Sys.time()
a <- future::future({Sys.sleep(1); 7})
b <- future::future({Sys.sleep(1); 8})
while (!future::resolved(a) || !future::resolved(b)) {
  Sys.sleep(0.05)
}
t <- Sys.time()
expect_true(future::resolved(a))
expect_true(future::resolved(b))
expect_equal(future::result(a)$value, 7)
expect_equal(future::result(b)$value, 8)
# If this is truly parallel then it'll have taken less than the sequential
# number of seconds -- ideally just over but let's allow a little room for
# machine load or what have you.
expect_true(as.numeric(t-s, units='secs') < 1.5)
