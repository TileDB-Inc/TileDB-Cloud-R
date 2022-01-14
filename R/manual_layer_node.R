# ================================================================
# TODO: comment re this being opaque to what the payload *is*.
# Execution logic all in the Delayed class (which is the nominal payload).
# ================================================================
 
nodeGenerator <- setRefClass("Node", representation(
  # The payload slot must be of type Delayed but we can't say that due to
  # circular references. So, we enforce this type constraint at runtime.
  payload      = "ANY",
  uuid         = "character",
  display_name = "character",
  parent_nodes = "list",
  child_nodes  = "list",
  status       = "character",
  dag          = "DAG"
))

nodeGenerator$methods(
  initialize = function(.self, payload, display_name=NULL) {
    .self$uuid <- uuid::UUIDgenerate()
    .self$payload <- payload
    if (is.null(display_name)) {
      .self$display_name <- .self$uuid
    } else {
      .self$display_name <- display_name
    }
    .self$status <- NOT_STARTED
  },

  add_parent = function(.self, parent_node) {
    stopifnot(is(parent_node, "Node"))
    .self$parent_nodes[[parent_node$uuid]] = parent_node
    parent_node$child_nodes[[.self$uuid]] <- .self
  },

  set_dag = function(.self, dag) {
    .self$dag <- dag
  },

  is_initial = function(.self) {
    length(.self$parent_nodes) == 0
  },

  is_terminal = function(.self) {
    length(.self$child_nodes) == 0
  },

  str = function(.self) {
    utils::str(.self, max.level=5)
  }
)

# Our data structures have parent->child->parent->...  loops if followed
# naively and we want non-stack-overflow as the *default* behavior.
setMethod("str", signature(object = "Node"), function(object) {
  object$str()
})
setMethod("show", signature(object = "Node"), function(object) {
  object$str()
})
