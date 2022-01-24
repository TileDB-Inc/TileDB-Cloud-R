# DAG is an R reference class. We need references since we have a mutable DAG of nodes
# and we must be able to update them as their computation progresses.
#
# Nominally this is invoked by the terminal node's compute() method.
##' @export
##' @importFrom future plan multicore multisession
DAG <- R6::R6Class(
  'DAG',
  public = list(
    namespace      = NULL,
    all_nodes      = NULL,
    initial_nodes  = NULL,
    terminal_node  = NULL,

    # ================================================================
    # INITIALIZATION METHODS

    initialize = function(terminal_node, namespace) {
      self$namespace <- namespace
      self$populate(terminal_node)
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
    # What we do here is locate the initial nodes and the terminal node.
    populate = function(terminal_node) {
      if (!is(terminal_node, "Node")) {
        stop("Terminal node must be an instance of the Node class; got ", class(terminal_node))
      }
      self$all_nodes <- list()
      self$initial_nodes <- list()
      self$populate_aux(terminal_node)
      if (length(self$all_nodes) == 0) {
        stop("Task graph is empty")
      }
      if (length(self$initial_nodes) == 0) {
        stop("Task graph has a cycle")
      }

      self$terminal_node <- terminal_node

      # This makes our print output non-frustrating for the user to read
      self$sort_nodes_topologically()
    },

    # This is a recursive helper function for populate().
    populate_aux = function(node) {
      if (!is.null(self$all_nodes[[node$id]])) {
        # In R, just "return" does not actually ... return. :^/
        return()
      }

      self$all_nodes[[node$id]] <- node

      if (node$is_initial()) {
        self$initial_nodes[[node$id]] <- node
      }

      for (arg in node$args) {
        if (is(arg, "Node")) {
          self$populate_aux(arg)
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
    sort_nodes_topologically = function() {
      if (is.null(self$initial_nodes) || length(self$initial_nodes) == 0) {
        stop("initial nodes must be identified before topological sort")
      }
      sorted_nodes <- list()
      initial_nodes <- self$initial_nodes

      while (length(initial_nodes) > 0) {
        node <- initial_nodes[[1]]
        initial_nodes[[1]] <- NULL

        # If we have the terminal first and initials last, this
        # edge-enumeration is very quick: 'for (arg in node$args)'. For
        # display, initials-first or terminals-first is equally nice. But for
        # future use with server-side task graphs, we'll need initials first.
        # So we may as well do this initials-first.
        sorted_nodes[[node$id]] <- node

        # Initials first:
        for (other in self$find_nodes_depending_directly_on(node)) {
          initial_nodes[[other$id]] <- other
        }
      }

      self$all_nodes <- sorted_nodes
    },

    # This is a helper function for topological sort. Finding all the args
    # of a node is easy: node$args. This goes the other way around.
    #
    # Example:
    # * a is initial
    # * b and c both have a as arg
    # * d has b and c as args.
    # * Then for node b: b$args is list(a). We want this function to return list(d).
    find_nodes_depending_directly_on = function(node) {
      retval <- list()
      for (other in self$all_nodes) {
        if (node$is_arg_of(other)) {
          retval[[other$id]] <- other
        }
      }
      unname(retval)
    },

    # ================================================================
    # COMPUTE

    # This is a synchronous wait.  If more inspection is desired, then one can do
    # dag <- terminal_node$make_dag(), then dag$poll() and show(dag) / str(dag)
    # repeatedly in order better to visualize the flow of computation through the
    # graph.
    compute = function(timeout_seconds=NULL, verbose=FALSE) {

      if (verbose) show(self)
      # This is crucial for our use of the future package -- we don't get parallelism by default
      #future::plan(future::multisession)
      future::plan(future::multicore)

      start <- Sys.time()
      while (self$poll(verbose=verbose) == FALSE) {
        now <- Sys.time()
        elapsed_seconds <- as.numeric(now-start, units='secs')
        if (!is.null(timeout_seconds)) {
          if (elapsed_seconds > timeout_seconds) {
            cat("TIMEOUT\n")
            break
          }
        }

        Sys.sleep(0.1)
      }

      if (verbose) show(self)
      self$terminal_node$result
    },

    # This *must* be called periodically to update nodes and launch dependents.
    # Our poll-driven DAGs won't auto-run without this being invoked
    # periodically.
    poll = function(verbose=FALSE) {
      terminal_done <- self$terminal_node$poll(namespace=self$namespace, verbose=verbose)
    },

    # ================================================================
    # DEBUG/DISPLAY

    get_display_names_for_nodes = function(nodes) {
      sapply(nodes, function(node) { node$display_name})
    },
    show_node_list = function(description, nodes) {
      count <- length(nodes)
      display_names <- as.vector(self$get_display_names_for_nodes(nodes))
      display_names_string <- paste(display_names, collapse=", ")
      cat(description, " (", count, ") ", display_names_string, "\n", sep="")
    },

    show = function() {
      cat("Namespace: ", self$namespace, "\n", sep="")
      self$show_node_list("All      nodes:   ", self$all_nodes)
      self$show_node_list("Initial  nodes:   ", self$initial_nodes)
      self$show_node_list("Terminal node:    ", list(self$terminal_node))
      cat("Dependencies:\n")
      for (node in self$all_nodes) {
        if (length(node$args) > 0) {
          deps <- node$args[sapply(node$args, function(arg) {is(arg, "Node")})]
          self$show_node_list(paste0("  ", node$display_name), deps)
        } else {
          self$show_node_list(paste0("  ", node$display_name), list())
        }
      }
      cat("Statuses:\n")
      for (node in self$all_nodes) {
        node$show_status()
      }
    }
  )
)

# ================================================================
# GENERICS

setMethod("show", signature(object = "DAG"), function(object) {
  object$show()
})
