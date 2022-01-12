library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
d <- delayed(function(a,b){a+b}, list(1,2))
expect_equal(compute(d), 3)

# ----------------------------------------------------------------
d <- delayed(function(a,b){a+b}, list(1,2))
args(d) <- list(3, 4)
expect_equal(compute(d), 7)

# ----------------------------------------------------------------
d <- delayed(function(a,b){a+b})
args(d) <- list(5, 6)
expect_equal(compute(d), 11)

# ----------------------------------------------------------------
a = delayed(function() { Sys.sleep(1); 3 })
args(a) <- list()
o = compute(a)
expect_equal(o, 3)

## ----------------------------------------------------------------
c = delayed(function(x,y,z) { x+y+z })
args(c) <- list(3,4,5)
o = compute(c)
expect_equal(o, 12)

# ----------------------------------------------------------------
a = delayed(function() { Sys.sleep(1); 3 }, list())
b = delayed(function() { Sys.sleep(1); 4 }, list())
d = delayed(function(x,y,z) { x+y+z })
args(d) <- list(a,b,5)
o = compute(d)
expect_equal(o, 12)

# ----------------------------------------------------------------
a = delayed(function() { Sys.sleep(1); 3 }, list())
b = delayed(function() { Sys.sleep(1); 4 }, list())
d = delayed(function(x,y,z) { x+y+z }, list(a,b,5))
o = compute(d)
expect_equal(o, 12)

# ----------------------------------------------------------------
a = delayed(function()  { Sys.sleep(1); 7 }, list())
b = delayed(function(x) { Sys.sleep(1); x*100 }, list(a))
c = delayed(function(x) { Sys.sleep(1); x*10 }, list(a))
d = delayed(function(x,y) { x+y }, list(b,c))
o = compute(d)
expect_equal(o, 770)
