# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

# Local and non-local test files are in separate files. This is to (a) validate
# correct functioning of non-cloud-dependent and cloud-dependent things; (b)
# separate what can be tested without and with cloud credentials.  Let's keep
# this separation of files.

# ----------------------------------------------------------------
library(tinytest)

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

# ----------------------------------------------------------------
library(tiledbcloud)

# ----------------------------------------------------------------
# Namespacing priorities:

# 1. From node
a <- delayed(function() { 9 }, name='a', namespace=namespaceToCharge, local=FALSE)
expect_equal(compute(a, timeout_seconds=300), 9)

# 2. From DAG level at compute()
a <- delayed(function() { 9 }, name='a', local=FALSE)
expect_equal(compute(a, namespace=namespaceToCharge, timeout_seconds=300), 9)

# # 3. From account lookup
# This is well-intentioned but only works if the user _has_ a default namespace
# configured in their account -- which we mustn't assume.
# a <- delayed(function() { 9 }, name='a', local=FALSE)
# expect_equal(compute(a, timeout_seconds=300), 9)

# ----------------------------------------------------------------
a <- delayed(function() { 9 }, name='a', local=FALSE)
expect_equal(compute(a, namespace=namespaceToCharge, timeout_seconds=300), 9)

# ----------------------------------------------------------------
a <- delayed(function()  { 9 },                  name='a', local=FALSE)
b <- delayed(function(x) { 11*x }, args=list(a), name='b', local=FALSE)
expect_equal(compute(b, namespace=namespaceToCharge, timeout_seconds=300), 99)

# ----------------------------------------------------------------
a <- delayed(function()    { 9 },                        name='a', local=FALSE)
b <- delayed(function(x)   { 10*x },     args=list(a),   name='b', local=FALSE)
c <- delayed(function(x)   { 100*x },    args=list(a),   name='c', local=FALSE)
d <- delayed(function(...) { sum(...) }, args=list(b,c), name='d', local=FALSE)
expect_equal(compute(d, namespace=namespaceToCharge, timeout_seconds=300), 990)

# ----------------------------------------------------------------
a <- delayed(function()  { 9 },                      name='a', local=FALSE)

b <- delayed(function(x) {      1*x }, args=list(a), name='b', local=FALSE)
c <- delayed(function(x) {     10*x }, args=list(a), name='c', local=FALSE)
d <- delayed(function(x) {    100*x }, args=list(a), name='d', local=FALSE)
e <- delayed(function(x) {   1000*x }, args=list(a), name='e', local=FALSE)
f <- delayed(function(x) {  10000*x }, args=list(a), name='f', local=FALSE)
g <- delayed(function(x) { 100000*x }, args=list(a), name='g', local=FALSE)

h <- delayed(function(...) { sum(...) },   args=list(b,c,d,e,f,g),   name='h', local=FALSE)

expect_equal(compute(h, namespace=namespaceToCharge, timeout_seconds=300), 999999)
