## ================================================================
## See comments on test_delayed_1.R regarding filenames for these test cases.
## ================================================================

library(tiledbcloud)
library(future)
library(tinytest)

# Local and non-local test files are in separate files. This is to (a) validate
# correct functioning of non-cloud-dependent and cloud-dependent things; (b)
# separate what can be tested without and with cloud credentials.  Let's keep
# this separation of files.

# ----------------------------------------------------------------
a <- delayed(function() { Sys.sleep(0.2); 9 }, display_name='a', do_local=TRUE)
expect_equal(compute(a, namespace='test-namespace'), 9)

# ----------------------------------------------------------------
a <- delayed(function()  { Sys.sleep(0.1);    9 },               display_name='a', do_local=TRUE)
b <- delayed(function(x) { Sys.sleep(0.2); 11*x }, args=list(a), display_name='b', do_local=TRUE)
expect_equal(compute(b, namespace='test-namespace'), 99)

# ----------------------------------------------------------------
a <- delayed(function()    { Sys.sleep(0.2);     9 },                      display_name='a', do_local=TRUE)
b <- delayed(function(x)   { Sys.sleep(0.1);  10*x },      args=list(a),   display_name='b', do_local=TRUE)
c <- delayed(function(x)   { Sys.sleep(0.3); 100*x },      args=list(a),   display_name='c', do_local=TRUE)
d <- delayed(function(...) { Sys.sleep(0.2);   sum(...) }, args=list(b,c), display_name='d', do_local=TRUE)
expect_equal(compute(d, namespace='test-namespace'), 990)

# ----------------------------------------------------------------
a <- delayed(function()  { Sys.sleep(0.1);        9 },               display_name='a', do_local=TRUE)

b <- delayed(function(x) { Sys.sleep(0.8);      1*x }, args=list(a), display_name='b', do_local=TRUE)
c <- delayed(function(x) { Sys.sleep(0.8);     10*x }, args=list(a), display_name='c', do_local=TRUE)
d <- delayed(function(x) { Sys.sleep(0.8);    100*x }, args=list(a), display_name='d', do_local=TRUE)
e <- delayed(function(x) { Sys.sleep(0.8);   1000*x }, args=list(a), display_name='e', do_local=TRUE)
f <- delayed(function(x) { Sys.sleep(0.8);  10000*x }, args=list(a), display_name='f', do_local=TRUE)
g <- delayed(function(x) { Sys.sleep(0.8); 100000*x }, args=list(a), display_name='g', do_local=TRUE)

h <- delayed(function(...) { sum(...) },   args=list(b,c,d,e,f,g),   display_name='h', do_local=TRUE)

expect_equal(compute(h, namespace='test-namespace'), 999999)

# ----------------------------------------------------------------
a <- delayed(function()    { Sys.sleep(0.1);    9 }, display_name='a', do_local=TRUE)
b <- delayed(function(x)   { Sys.sleep(0.2); 11*x }, display_name='b', do_local=TRUE)
a$set_args(list(b))
b$set_args(list(a))
# This has a cycle
expect_error(compute(b, namespace='test-namespace'))
