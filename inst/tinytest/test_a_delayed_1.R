# ================================================================
# Context of test_delayed_1.R, test_delayed_2.R, etc:
#
# Since we need mutable references in the DAG data structure, we use R
# reference classes, which have their own semantics and which may not be
# familiar to everyone. Integration with futures adds complexity. And lastly,
# testing with TileDB Cloud UDFs adds distributed-computing complexity.
#
# These things make it unclear where to *start* -- not only for initial
# development of this package, but for any future deep rework of this package:
# * Porting to another language
# * Dealing with a disruptive upgrade of some dependency
# * Replacing one dependent package with another
# * Refactoring for whatever reason.
# -- for any of those, people will likely need to recapitulate the development
# sequencing.
#
# For these reasons, these test are split up, and -- since tests are listed and
# run in alphabetical order -- their filenames are chosen to reflect the
# chronological development order.
# * Test out the delayed function, and the Delayed, Node, and DAG reference
#   classes syntactically. Make sure sure mutability and references are
#   validated first. Do this with purely local functions which do things
#   like sleep two seconds and return the sum or product of two arguments.
# * Introduce futures and test our understanding of that library iteratively.
# * Then test attaching futures to the DAG computation.
# * Then add in remote execution of UDFs on TileDB Cloud without futures.
# * Then add in remote execution of UDFs on TileDB Cloud with futures.
# * Etc.
# ================================================================

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
a <- delayed(function(...){sum(...)}, args=list(1,2))
expect_equal(a$compute_sequentially(), 3)

# ----------------------------------------------------------------
a <- delayed(function(...){sum(...)}, args=list(1,2))
args(a) <- list(3, 4)
expect_equal(a$compute_sequentially(), 7)

# ----------------------------------------------------------------
a <- delayed(function(...){sum(...)})
args(a) <- list(5, 6)
expect_equal(a$compute_sequentially(), 11)

# ----------------------------------------------------------------
a <- delayed(function() { Sys.sleep(0.1); 3 })
args(a) <- list()
o <- a$compute_sequentially()
expect_equal(o, 3)

## ----------------------------------------------------------------
a <- delayed(function(...) { sum(...) })
args(a) <- list(3,4,5)
o <- a$compute_sequentially()
expect_equal(o, 12)

# ----------------------------------------------------------------
a <- delayed(function() { Sys.sleep(0.1); 3 }, args=list())
b <- delayed(function() { Sys.sleep(0.1); 4 }, args=list())
d <- delayed(function(...) { sum(...) })
args(d) <- list(a,b,5)
o <- d$compute_sequentially()
expect_equal(o, 12)

# ----------------------------------------------------------------
a <- delayed(function() { Sys.sleep(0.1); 3 }, args=list())
b <- delayed(function() { Sys.sleep(0.1); 4 }, args=list())
d <- delayed(function(...) { sum(...) }, args=list(a,b,5))
o <- d$compute_sequentially()
expect_equal(o, 12)

# ----------------------------------------------------------------
a <- delayed(function()  { Sys.sleep(0.1);     7 }, args=list())
b <- delayed(function(x) { Sys.sleep(0.1); x*100 }, args=list(a))
c <- delayed(function(x) { Sys.sleep(0.1);  x*10 }, args=list(a))
d <- delayed(function(...) { sum(...) }, args=list(b,c))
o <- d$compute_sequentially()
expect_equal(o, 770)

# ----------------------------------------------------------------
# Check that result-caching is in place.
s <- Sys.time()

a <- delayed(function(){Sys.sleep(0.1); 9 })

b <- delayed(function(x){     1*x}, args=list(a))
c <- delayed(function(x){    10*x}, args=list(a))
d <- delayed(function(x){   100*x}, args=list(a))
e <- delayed(function(x){  1000*x}, args=list(a))
f <- delayed(function(x){ 10000*x}, args=list(a))

g <- delayed(function(s,t,u,v,w){s+t+u+v+w}, args=list(b,c,d,e,f))
o <- g$compute_sequentially()
t <- Sys.time()

expect_equal(o, 99999)
# If a's value were not re-used then this would have taken at least 5 seconds.
expect_true(as.numeric(t-s, units='secs') < 2)
