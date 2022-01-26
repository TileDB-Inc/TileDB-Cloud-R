# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
# For testing topological sort. Note that topological sorts are not unique,
# so we can't just check node names against a single expected ordering.
check_topo_sort <- function(dag, name1, name2) {
  node_names <- as.vector(sapply(dag$all_nodes, function(e) {e$name}))
  index1 <- which(node_names == name1)
  index2 <- which(node_names == name2)
  expect_true(index1 < index2)
}

# ----------------------------------------------------------------
a <- delayed(function() { 1 }, name='a', local=TRUE)

dag <- DAG$new(namespace="ns", terminal_node=a)

expect_equal(length(dag$all_nodes), 1)
expect_equal(length(dag$initial_nodes), 1)
expect_equal(dag$namespace, 'ns')

# ----------------------------------------------------------------
a <- delayed(function()    {      1 },               name='a', local=TRUE)
b <- delayed(function(x) {     20+x }, args=list(a), name='b', local=TRUE)
c <- delayed(function()  {      300 },               name='c', local=TRUE)
d <- delayed(function(x) {   4000+x }, args=list(c), name='d', local=TRUE)
e <- delayed(function(x,y) {  50000+x+y }, args=list(b,d), name='e', local=TRUE)

dag <- DAG$new(namespace="ns", terminal_node=e)

expect_equal(length(dag$all_nodes), 5)
expect_equal(length(dag$initial_nodes), 2)
expect_equal(dag$namespace, 'ns')

check_topo_sort(dag, 'a', 'b')
check_topo_sort(dag, 'c', 'd')
check_topo_sort(dag, 'a', 'e')
check_topo_sort(dag, 'b', 'e')
check_topo_sort(dag, 'c', 'e')
check_topo_sort(dag, 'd', 'e')

# ----------------------------------------------------------------
a <- delayed(function()    {      1 },               name='a', local=TRUE)
b <- delayed(function(x) {     20+x }, args=list(a), name='b', local=TRUE)
c <- delayed(function(x) {    300+x }, args=list(b), name='c', local=TRUE)
d <- delayed(function(x) {   4000+x }, args=list(c), name='d', local=TRUE)
e <- delayed(function(x) {  50000+x }, args=list(d), name='e', local=TRUE)
f <- delayed(function(x) { 600000+x }, args=list(e), name='f', local=TRUE)
g <- delayed(function(x) {7000000+x }, args=list(f), name='g', local=TRUE)

dag <- DAG$new(namespace="ns", terminal_node=g)

expect_equal(length(dag$all_nodes), 7)
expect_equal(length(dag$initial_nodes), 1)
expect_equal(dag$namespace, 'ns')

check_topo_sort(dag, 'a', 'b')
check_topo_sort(dag, 'b', 'c')
check_topo_sort(dag, 'c', 'd')
check_topo_sort(dag, 'd', 'e')
check_topo_sort(dag, 'e', 'f')
check_topo_sort(dag, 'f', 'g')

# ----------------------------------------------------------------
a <- delayed(function() { 3 }, name='a')
b <- delayed(function() { 5 }, name='b')
c <- delayed(function() { 7 }, name='c')

d <- delayed(sum, args=list(a,b),   name='d')
e <- delayed(sum, args=list(c,d),   name='e')
f <- delayed(sum, args=list(c),     name='f')
g <- delayed(sum, args=list(a,e,f), name='g')

dag <- DAG$new(namespace="ns", terminal_node=g)

expect_equal(length(dag$all_nodes), 7)
expect_equal(length(dag$initial_nodes), 3)
expect_equal(dag$namespace, 'ns')

check_topo_sort(dag, 'a', 'd')
check_topo_sort(dag, 'a', 'g')
check_topo_sort(dag, 'b', 'd')
check_topo_sort(dag, 'c', 'e')
check_topo_sort(dag, 'c', 'f')
check_topo_sort(dag, 'd', 'e')
check_topo_sort(dag, 'e', 'g')
check_topo_sort(dag, 'f', 'g')
