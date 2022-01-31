## ================================================================
## See comments on test_delayed_1.R regarding filenames for these test cases.
## ================================================================

library(tiledbcloud)
library(tinytest)

# Local and non-local test files are in separate files. This is to (a) validate
# correct functioning of non-cloud-dependent and cloud-dependent things; (b)
# separate what can be tested without and with cloud credentials.  Let's keep
# this separation of files.

# ----------------------------------------------------------------
a <- delayed(function() { Sys.sleep(0.2); 9 }, name='a')
expect_equal(compute(a, force_all_local=TRUE), 9)

# ----------------------------------------------------------------
a <- delayed(function()  { Sys.sleep(0.1);    9 },               name='a')
b <- delayed(function(x) { Sys.sleep(0.2); 11*x }, args=list(a), name='b')
expect_equal(compute(b, force_all_local=TRUE), 99)

# ----------------------------------------------------------------
# Test with non-null timeout_seconds
a <- delayed(function()  { Sys.sleep(0.1);    9 },               name='a')
b <- delayed(function(x) { Sys.sleep(0.2); 11*x }, args=list(a), name='b')
expect_equal(compute(b, force_all_local=TRUE, timeout_seconds=30), 99)

# ----------------------------------------------------------------
a <- delayed(function()    { Sys.sleep(0.2);     9 },                      name='a')
b <- delayed(function(x)   { Sys.sleep(0.1);  10*x },      args=list(a),   name='b')
c <- delayed(function(x)   { Sys.sleep(0.3); 100*x },      args=list(a),   name='c')
d <- delayed(function(...) { Sys.sleep(0.2);   sum(...) }, args=list(b,c), name='d')
expect_equal(compute(d, force_all_local=TRUE), 990)

# ----------------------------------------------------------------
a <- delayed(function()  { Sys.sleep(0.1);        9 },               name='a')

b <- delayed(function(x) { Sys.sleep(0.8);      1*x }, args=list(a), name='b')
c <- delayed(function(x) { Sys.sleep(0.8);     10*x }, args=list(a), name='c')
d <- delayed(function(x) { Sys.sleep(0.8);    100*x }, args=list(a), name='d')
e <- delayed(function(x) { Sys.sleep(0.8);   1000*x }, args=list(a), name='e')
f <- delayed(function(x) { Sys.sleep(0.8);  10000*x }, args=list(a), name='f')
g <- delayed(function(x) { Sys.sleep(0.8); 100000*x }, args=list(a), name='g')

h <- delayed(function(...) { sum(...) },   args=list(b,c,d,e,f,g),   name='h')

expect_equal(compute(h, force_all_local=TRUE), 999999)

# ----------------------------------------------------------------
a <- delayed(function()    { Sys.sleep(0.1);    9 }, name='a')
b <- delayed(function(x)   { Sys.sleep(0.2); 11*x }, name='b')
delayed_args(a) <- list(b)
delayed_args(b) <- list(a)
expect_error(compute(b, force_all_local=TRUE), pattern='Task graph has a cycle')

# ----------------------------------------------------------------
a <- delayed(function()    { Sys.sleep(10);    9 }, name='a')
b <- delayed(function(x)   { Sys.sleep(1);  11*x }, name='b')
delayed_args(b) <- list(a)
expect_error(compute(b, force_all_local=TRUE, timeout_seconds=1), pattern='Timeout')

# ----------------------------------------------------------------
# Make sure user-level messages (nominally executed on the cloud) propagate all
# the way back up to the client.
a <- delayed(function()    { stop("cabbage") },          name='a')
b <- delayed(function(x)   {  10*x    }, args=list(a),   name='b')
c <- delayed(function(x)   { 100*x    }, args=list(a),   name='c')
d <- delayed(function(...) { sum(...) }, args=list(b,c), name='d')
expect_error(compute(d, force_all_local=TRUE), pattern='cabbage')

a <- delayed(function()    {     9    },                        name='a')
b <- delayed(function(x)   {  10*x    },        args=list(a),   name='b')
c <- delayed(function(x)   { stop("carrots") }, args=list(a),   name='c')
d <- delayed(function(...) { sum(...) },        args=list(b,c), name='d')
expect_error(compute(d, force_all_local=TRUE), pattern='carrots')

a <- delayed(function()    {     9    },                            name='a')
b <- delayed(function(x)   {  10*x    },            args=list(a),   name='b')
c <- delayed(function(x)   { 100*x    },            args=list(a),   name='c')
d <- delayed(function(...) { stop("cauliflower") }, args=list(b,c), name='d')
expect_error(compute(d, force_all_local=TRUE), pattern='cauliflower')
