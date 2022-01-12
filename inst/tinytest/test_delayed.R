library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
a <- delayed(function(x,y){x+y}, list(1,2))
expect_equal(a$compute(), 3)

# ----------------------------------------------------------------
a <- delayed(function(x,y){x+y}, list(1,2))
a$set_args(list(3, 4))
expect_equal(a$compute(), 7)

# ----------------------------------------------------------------
a <- delayed(function(x,y){x+y})
a$set_args(list(5, 6))
expect_equal(a$compute(), 11)

# ----------------------------------------------------------------
a = delayed(function() { Sys.sleep(1); 3 })
a$set_args( list())
o = a$compute()
expect_equal(o, 3)

## ----------------------------------------------------------------
a = delayed(function(x,y,z) { x+y+z })
a$set_args(list(3,4,5))
o = a$compute()
expect_equal(o, 12)

# ----------------------------------------------------------------
a = delayed(function() { Sys.sleep(1); 3 }, list())
b = delayed(function() { Sys.sleep(1); 4 }, list())
d = delayed(function(x,y,z) { x+y+z })
d$set_args(list(a,b,5))
o = d$compute()
expect_equal(o, 12)

# ----------------------------------------------------------------
a = delayed(function() { Sys.sleep(1); 3 }, list())
b = delayed(function() { Sys.sleep(1); 4 }, list())
d = delayed(function(x,y,z) { x+y+z }, list(a,b,5))
o = d$compute()
expect_equal(o, 12)

# ----------------------------------------------------------------
a = delayed(function()  { Sys.sleep(1); 7 }, list())
b = delayed(function(x) { Sys.sleep(1); x*100 }, list(a))
c = delayed(function(x) { Sys.sleep(1); x*10 }, list(a))
d = delayed(function(x,y) { x+y }, list(b,c))
o = d$compute()
expect_equal(o, 770)
