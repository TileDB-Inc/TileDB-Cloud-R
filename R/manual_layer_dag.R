# DAG is an R reference class. We need references since we have a mutable DAG of nodes
# and we must be able to update them as their computation progresses.
#
# Nominally this is invoked by the terminal node's compute() method.
dagGenerator <- setRefClass("DAG", representation(
  namespace         = "character",
  all_nodes         = "list",
  initial_nodes     = "list",
  terminal_nodes    = "list"
))

dagGenerator$methods(

  # ================================================================
  # INITIALIZATION

  initialize = function(.self, terminal_node, namespace) {
    .self$namespace <- namespace
    # TODO: pluralize everywhere, so we can have multiple terminal nodes.
    .self$populate(terminal_node)
  },

  # Nodes already have a graph structure. For example:
  #   a <- delayed(function()    {    9  },                    display_name='a', do_local=FALSE)
  #   b <- delayed(function(x)   {  10*x },    args=list(a),   display_name='b', do_local=FALSE)
  #   c <- delayed(function(x)   { 100*x },    args=list(a),   display_name='c', do_local=FALSE)
  #   d <- delayed(function(...) { sum(...) }, args=list(b,c), display_name='d', do_local=FALSE)
  # has DAG like
  #    a
  #   / \
  #  v   v
  #  b   c
  #   \ /
  #    v
  #    d
  #
  # What we do here is locate the initial and terminal nodes.
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

    # This makes our print output non-frustrating for the user to read
    .self$sort_nodes_topologically()
  },

  # This is a recursive helper function for populate().
  populate_aux = function(.self, node) {
    if (!is.null(.self$all_nodes[[node$id]])) {
      # In R, just "return" does not actually ... return. ;)
      return()
    }

    .self$all_nodes[[node$id]] <- node

    if (node$is_initial()) {
      .self$initial_nodes[[node$id]] <- node
    }

    for (arg in node$args) {
      if (is(arg, "Node")) {
        .self$populate_aux(arg)
      }
    }
  },

  # This is important so our status display is non-frustrating for the user.
  # This assumes a cyclicity check has already been done.
  # https://en.wikipedia.org/wiki/Topological_sorting Technically this is a
  # reverse topological sort -- terminals appear first, then the ones that
  # depend on them. This is intuitive for the user (and this topological sort
  # is *only* for display to the user) since we normally write 'z <- f(x,y)'
  # rather than 'f(x,y) -> z' -- so it makes sense to show z, then x and y.
  sort_nodes_topologically = function(.self) {
    if (length(.self$terminal_nodes) == 0) {
      stop("terminal nodes must be identified before topological sort")
    }
    unsorted_nodes <- .self$all_nodes
    sorted_nodes <- list()
    terminal_nodes <- .self$terminal_nodes # this is a copy of a list of reference classes

    while (length(terminal_nodes) > 0) {
      node <- terminal_nodes[[1]]
      terminal_nodes[[1]] <- NULL

      sorted_nodes[[node$id]] <- node
      for (arg in node$args) {
        if (is(arg, "Node")) {
          terminal_nodes[[arg$id]] <- arg
        }
      }
    }

    .self$all_nodes <- sorted_nodes
  },

  # ================================================================
  # COMPUTE

  # This is a synchronous wait.  If more inspection is desired, then one can do
  # dag <- terminal_node$make_dag(), then dag$poll() and show(dag) / str(dag)
  # repeatedly in order better to visualize the flow of computation through the
  # graph.
  compute = function(.self, timeout_seconds=120, verbose=FALSE) {

    # This is crucial for our use of the future package -- we don't get parallelism by default
    #future::plan(future::multisession)
    future::plan(future::multicore)

    start <- Sys.time()
    while (.self$poll(verbose=verbose) == FALSE) {
      now <- Sys.time()
      elapsed_seconds <- as.numeric(now-start, units='secs')
      if (elapsed_seconds > timeout_seconds) {
        cat("TIMEOUT\n")
        break
      }
      
      Sys.sleep(0.1)
    }

    if (length(.self$terminal_nodes) == 1) {
      .self$terminal_nodes[[1]]$result
    } else {
      sapply(.self$terminal_nodes, function(node) { node$result })
    }
  },

  # This *must* be called periodically to update nodes and launch dependents. A
  # DAG won't auto-run without this being invoked periodically.
  poll = function(.self, verbose=FALSE) {
    dag_done <- TRUE
    # Please do not replace this with anything that will break the loop -- we
    # must (recursively) poll all nodes in order to detect node completions and
    # launch dependents.
    terminal_dones <- sapply(.self$terminal_nodes, function(terminal_node) {
      terminal_done <- terminal_node$poll(namespace=.self$namespace, verbose=verbose)
    })
    all(terminal_dones)
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

  show = function(.self) {
    cat("Namespace: ", .self$namespace, "\n", sep="")
    .self$show_node_list("All      nodes:   ", .self$all_nodes)
    .self$show_node_list("Initial  nodes:   ", .self$initial_nodes)
    .self$show_node_list("Terminal nodes:   ", .self$terminal_nodes)
    cat("Dependencies:\n")
    for (node in .self$all_nodes) {
      if (length(node$args) > 0) {
        deps <- node$args[sapply(node$args, function(arg) {is(arg, "Node")})]
        .self$show_node_list(paste0("  ", node$display_name), deps)
      } else {
        .self$show_node_list(paste0("  ", node$display_name), list())
      }
    }
    cat("Statuses:\n")
    for (node in .self$all_nodes) {
      node$show_status()
    }
  }
)

# ================================================================
# GENERICS

setMethod("show", signature(object = "DAG"), function(object) {
  object$show()
})
