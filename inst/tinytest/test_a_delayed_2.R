# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
a <- delayed(function()  {    9 },                    name='a')
b <- delayed(function(x) {  1*x },    args=list(a),   name='b')
c <- delayed(function(x) { 10*x },    args=list(a),   name='c')
d <- delayed(function(...){sum(...)}, args=list(b,c), name='d')

expect_false(a$is_arg_of(a))
expect_true(a$is_arg_of(b))
expect_true(a$is_arg_of(c))
expect_false(a$is_arg_of(d))

expect_false(b$is_arg_of(a))
expect_false(b$is_arg_of(b))
expect_false(b$is_arg_of(c))
expect_true(b$is_arg_of(d))

expect_false(c$is_arg_of(a))
expect_false(c$is_arg_of(b))
expect_false(c$is_arg_of(c))
expect_true(c$is_arg_of(d))

expect_false(d$is_arg_of(a))
expect_false(d$is_arg_of(b))
expect_false(d$is_arg_of(c))
expect_false(d$is_arg_of(d))

# ----------------------------------------------------------------
dag <- DAG$new(namespace="ns", terminal_node=d)

expect_equal(length(dag$all_nodes), 4)
expect_equal(length(dag$initial_nodes), 1)
expect_equal(dag$namespace, 'ns')

expect_equal(sapply(dag$find_nodes_depending_directly_on(d), function(node) node$name), list())
expect_equal(sapply(dag$find_nodes_depending_directly_on(b), function(node) node$name), c("d"))
expect_equal(sapply(dag$find_nodes_depending_directly_on(c), function(node) node$name), c("d"))
expect_equal(sapply(dag$find_nodes_depending_directly_on(a), function(node) node$name), c("b", "c"))
