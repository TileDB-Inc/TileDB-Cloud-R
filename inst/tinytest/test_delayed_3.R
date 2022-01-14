# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(future)
library(tinytest)

# ----------------------------------------------------------------
# This tests our _understading_ of the future package before we begin
# to put it into use in the DAG logic.
future::plan(future::multisession)
s <- Sys.time()
a <- future({Sys.sleep(3); 7})
b <- future({Sys.sleep(2); 8})
while (!resolved(a) || !resolved(b)) {
  Sys.sleep(0.1)
}
t <- Sys.time()
expect_true(resolved(a))
expect_true(resolved(b))
expect_equal(result(a)$value, 7)
expect_equal(result(b)$value, 8)
# If this is truly parallel then it'll have taken less than 5 seconds --
# ideally just over 3 but let's allow a little room for machine load or what
# have you.
expect_true(as.numeric(t-s, units='secs') < 4)
