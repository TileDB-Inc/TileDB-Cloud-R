dagGenerator <- setRefClass("DAG", representation(
  namespace         = "character",
  all_nodes         = "list",
  initial_nodes     = "list",
  terminal_nodes    = "list",
  nodes_not_started = "list",
  nodes_running     = "list",
  nodes_completed   = "list",
  nodes_failed      = "list",
  timeout_seconds   = "numeric"
))

dagGenerator$methods(

  # ================================================================
  # INITIALIZATION

  initialize = function(.self, namespace, terminal_node=NULL) {
    if (!is.null(terminal_node)) {
      .self$populate(terminal_node)
    }
    .self$timeout_seconds = 5 # TODO: take from optarg, and/or have an after-accessor
  },

  populate = function(.self, terminal_node) {
    if (!is(terminal_node, "Node")) {
      stop("Terminal node must be an instance of the Node class; got ", class(terminal_node))
    }
    .self$all_nodes <- list()
    .self$initial_nodes <- list()
    .self$populate_aux(terminal_node)
    if (length(.self$all_nodes) == 0) {
      stop("Task graph is empty")
    }
    if (length(.self$initial_nodes) == 0) {
      stop("Task graph has a cycle")
    }

    .self$terminal_nodes <- list(terminal_node)

    .self$nodes_not_started <- .self$all_nodes
    .self$nodes_running     <- list()
    .self$nodes_completed   <- list()
    .self$nodes_failed      <- list()
  },

  # TODO: note precondition that all the node edges are set up already.
  populate_aux = function(.self, node) {
    if (!is.null(.self$all_nodes[[node$uuid]])) {
      # In R, just "return" does not actually ... return. ;)
      return(invisible())
    }

    # Put reference to this DAG into each node.
    # TODO: this was necessary in the Python port to propagate access to
    # future.ThreadPoolExecutor. In the R future package there is no such --
    # check to make sure there aren't any other needs for this node$dag, and if
    # there aren't, remove it everywhere.
    node$dag <- .self

    .self$all_nodes[[node$uuid]] <- node

    if (node$is_initial()) {
      .self$initial_nodes[[node$uuid]] <- node
    }

    for (parent_node in node$parent_nodes) {
      .self$populate_aux(parent_node)
    }

    return(invisible())
  },

  # ================================================================
  # COMPUTE

  compute = function(.self) {
    .self$launch_compute()

    .self$await_compute()
  },

  launch_compute = function(.self) {
    # Set initial nodes' status to RUNNING
    # TODO: timeout ... code it up early for debug foo, don't wait :)
    for (node in .self$initial_nodes) {
      .self$nodes_not_started[[node$uuid]] <- NULL
      .self$nodes_running[[node$uuid]] <- node
      node$status <- RUNNING
    }

    # TODO: continue coding
  },

  is_compute_finished = function(.self) {
    # TODO: stub
    FALSE
  },

  await_compute = function(.self) {
    start <- Sys.time()
    # temp temp
    while (!.self$is_compute_finished()) {
      now <- Sys.time()
      elapsed_seconds <- as.numeric(now-start, units='secs')
      if (elapsed_seconds > .self$timeout_seconds) {
        # TODO: set dag status FAILED
        break
      }
      Sys.sleep(1)
      .self$show()
    }
  },

  # ================================================================
  # DEBUG/DISPLAY

  get_display_names_for_nodes = function(.self, nodes) {
    sapply(nodes, function(node) { node$display_name})
  },
  show_node_list = function(.self, description, nodes) {
    count <- length(nodes)
    display_names <- as.vector(.self$get_display_names_for_nodes(nodes))
    display_names_string <- paste(display_names, collapse=", ")
    cat(description, " (", count, ") ", display_names_string, "\n", sep="")
  },

  str = function(.self) {
    utils::str(.self, max.level=5)
  },

  show = function(.self) {
    cat("NAMESPACE     ", .self$namespace, "\n")
    .self$show_node_list("ALL      NODES    ", .self$all_nodes)
    .self$show_node_list("INITIAL  NODES    ", .self$initial_nodes)
    .self$show_node_list("TERMINAL NODES    ", .self$terminal_nodes)
    .self$show_node_list("NODES NOT STARTED ", .self$nodes_not_started)
    .self$show_node_list("NODES RUNNING     ", .self$nodes_running)
    .self$show_node_list("NODES COMPLETED   ", .self$nodes_completed)
    .self$show_node_list("NODES FAILED      ", .self$nodes_failed)
    cat("DEPENDENCIES:\n")
    for (node in .self$all_nodes) {
      .self$show_node_list(paste0("  ", node$display_name), node$parent_nodes)
    }
  }
)

# ================================================================
# GENERICS

# Our data structures have parent->child->parent->...  loops if followed
# naively and we want non-stack-overflow as the *default* behavior.
setMethod("str", signature(object = "DAG"), function(object, ...) {
  object$str()
})

setMethod("show", signature(object = "DAG"), function(object) {
  object$show()
})
