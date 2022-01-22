##' delayed is an exported factory function for the "Node" implementation class.
##'
##' Intentionally, Node has non-public consructor, but a few public accessors.
##'
##' @param args Can be provided here with \code{c <- delayed(function(...) { sum(...) }, args=list(a,b))}
##' or ##' separately with \code{c <- delayed(function(...) { sum(...) })` and later
##' \code{c$args <- list(a,b)}.
##'
##' @param display_name Optional -- e.g. \code{a} or \code{b}. If omitted, it defaults to a UUID.
##'
##' @param do_local If true, execute the functions on the local host; if else, execute them as
##' UDFs in TileDB Cloud.
##'
##' @family {manual-layer functions}
##' @export
delayed <- function(func, args=NULL, display_name=NULL, do_local=FALSE) {
  have_args <- FALSE

  if (is.null(args)) {
    # Function args were not passed here in the factory function. They'll need
    # to set args later. Unless the function takes no args in which it's
    # pedantic of us to insist on that.
    args <- list()
    if (length(formals(func)) == 0) {
      have_args <- TRUE
    }
  } else {
    # Function args were passed here in the factory function. They need
    # to be a list, like 'delayed(f, list(3,4))' not 'delayed(f, 3, 4)'.
    # TODO: find a way to accept the latter ...
    stopifnot(is.list(args))
    have_args <- TRUE
  }

  Node$new(func=func, args=args, have_args=have_args, display_name=display_name, do_local=do_local)
}
