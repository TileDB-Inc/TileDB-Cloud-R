# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

# Local and non-local test files are in separate files. This is to (a) validate
# correct functioning of non-cloud-dependent and cloud-dependent things; (b)
# separate what can be tested without and with cloud credentials.  Let's keep
# this separation of files.

# ----------------------------------------------------------------
library(tinytest)

if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "") {
    Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)
} else {
    if (!file.exists("~/.tiledb/cloud.json")) exit_file("No authentication")
}

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

# ----------------------------------------------------------------
library(tiledbcloud)

# ----------------------------------------------------------------
a <- delayed(function() { 9 }, display_name='a', do_local=FALSE)
expect_error(compute(a, timeout_seconds=300),
  pattern="namespace must be provided in a task graph with any non-local nodes")

# ----------------------------------------------------------------
a <- delayed(function() { 9 }, display_name='a', do_local=FALSE)
expect_equal(compute(a, namespace=namespaceToCharge, timeout_seconds=300), 9)

# ----------------------------------------------------------------
a <- delayed(function()  { 9 },                  display_name='a', do_local=FALSE)
b <- delayed(function(x) { 11*x }, args=list(a), display_name='b', do_local=FALSE)
expect_equal(compute(b, namespace=namespaceToCharge, timeout_seconds=300), 99)

# ----------------------------------------------------------------
a <- delayed(function()    { 9 },                        display_name='a', do_local=FALSE)
b <- delayed(function(x)   { 10*x },     args=list(a),   display_name='b', do_local=FALSE)
c <- delayed(function(x)   { 100*x },    args=list(a),   display_name='c', do_local=FALSE)
d <- delayed(function(...) { sum(...) }, args=list(b,c), display_name='d', do_local=FALSE)
expect_equal(compute(d, namespace=namespaceToCharge, timeout_seconds=300), 990)

# ----------------------------------------------------------------
a <- delayed(function()  { 9 },                      display_name='a', do_local=FALSE)

b <- delayed(function(x) {      1*x }, args=list(a), display_name='b', do_local=FALSE)
c <- delayed(function(x) {     10*x }, args=list(a), display_name='c', do_local=FALSE)
d <- delayed(function(x) {    100*x }, args=list(a), display_name='d', do_local=FALSE)
e <- delayed(function(x) {   1000*x }, args=list(a), display_name='e', do_local=FALSE)
f <- delayed(function(x) {  10000*x }, args=list(a), display_name='f', do_local=FALSE)
g <- delayed(function(x) { 100000*x }, args=list(a), display_name='g', do_local=FALSE)

h <- delayed(function(...) { sum(...) },   args=list(b,c,d,e,f,g),   display_name='h', do_local=FALSE)

expect_equal(compute(h, namespace=namespaceToCharge, timeout_seconds=300), 999999)
