nodeGenerator <- setRefClass("Node", representation(
  # The payload slot must be of type Delayed but we can't say that due to
  # circular references. So, we enforce this type constraint at runtime.
  payload      = "ANY",
  uuid         = "character",
  parent_nodes = "list",
  child_nodes  = "list"
))

nodeGenerator$methods(
  initialize = function(.self, payload) {
    .self$uuid = uuid::UUIDgenerate()
  },
  add_parent = function(.self, parent_node) {
    stopifnot(is(parent_node, "Node"))
    .self$parent_nodes[[parent_node$uuid]] = parent_node
    parent_node$child_nodes[[.self$uuid]] = .self
  }
)
