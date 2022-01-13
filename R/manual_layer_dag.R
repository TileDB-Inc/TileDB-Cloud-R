dagGenerator <- setRefClass("DAG", representation(
  namespace       = "character",
  all_nodes       = "list",
  root_nodes      = "list",
  nodes_by_status = "list"
))

dagGenerator$methods(

  initialize = function(.self, namespace, terminal_node=NULL) {
    if (!is.null(terminal_node)) {
      .self$populate(terminal_node)
    }
  },

  populate = function(.self, terminal_node) {
    if (!is(terminal_node, "Node")) {
      stop("Terminal node must be an instance of the Node class; got ", class(terminal_node))
    }
    .self$all_nodes <- list()
    .self$root_nodes <- list()
    .self$populate_aux(terminal_node)
    if (length(.self$all_nodes) == 0) {
      stop("Task graph is empty")
    }
    if (length(.self$root_nodes) == 0) {
      stop("Task graph has a cycle")
    }
  },

  # TODO: note precondition that all the node edges are set up already.
  populate_aux = function(.self, node) {
    if (!is.null(.self$all_nodes[[node$uuid]])) {
      # In R, just "return" does not actually ... return. ;)
      return(invisible())
    }
    .self$all_nodes[[node$uuid]] <- node
    if (node$is_initial()) {
      .self$root_nodes[[node$uuid]] <- node
    }
    for (parent_node in node$parent_nodes) {
      .self$populate_aux(parent_node)
    }
    return(invisible())
  },

  # compute = function(.self) {
  #   set root nodes status to RUNNING
  #   
  # }

  str = function(.self) {
    utils::str(.self, max.level=5)
  }
)

# Our data structures have parent->child->parent->...  loops if followed
# naively and we want non-stack-overflow as the *default* behavior.
setMethod("str", signature(object = "DAG"), function(object, ...) {
  object$str()
})
