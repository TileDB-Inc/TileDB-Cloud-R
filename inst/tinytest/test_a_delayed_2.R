# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(future)
library(tinytest)

# ----------------------------------------------------------------
a <- delayed(function()  {    9 },                    display_name='a')
b <- delayed(function(x) {  1*x },    args=list(a),   display_name='b')
c <- delayed(function(x) { 10*x },    args=list(a),   display_name='c')
d <- delayed(function(...){sum(...)}, args=list(b,c), display_name='d')

dag <- DAG$new(namespace="ns", terminal_node=d)

expect_equal(length(dag$all_nodes), 4)
expect_equal(length(dag$initial_nodes), 1)
expect_equal(length(dag$terminal_nodes), 1)
expect_equal(dag$namespace, 'ns')
