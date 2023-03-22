
##' Configure TileDB Cloud
##'
##' Provide the setup configuration for the TileDB Cloud package.
##'
##' It considers four different environment variables:
##' \code{TILEDB_REST_TOKEN}, \code{TILEDB_REST_HOST},
##' \code{TILEDB_REST_USERNAME}, and \code{TILEDB_REST_PASSWORD}.
##'
##' To operate, \emph{either} an API token has to be provided and will
##' be used, \emph{or} the username and password combination will be
##' used to log in with a new session.
##'
##' @return A named vector with configuration values is returned.
##' @export
configure <- function() {

    ## If TILEDB_REST_TOKEN_UNITTEST is supplied (as in CI) it used when no default token
    ## is set, ditto for the username. This is sufficient for CI runs.  Normal use is enabled
    ## by either using a token or a username and password (or both).  The host can be unset
    ## and defaults to the TileDB instance.
    cat("CFG ENTER ================================================================\n")
    token      <- Sys.getenv("TILEDB_REST_TOKEN", Sys.getenv("TILEDB_REST_TOKEN_UNITTEST"))
    host       <- Sys.getenv("TILEDB_REST_HOST", "https://api.tiledb.com")
    username   <- Sys.getenv("TILEDB_REST_USERNAME", "unittest")
    password   <- Sys.getenv("TILEDB_REST_PASSWORD", "")
    verify_ssl <- TRUE
    cat("\n")
    cat("TOKEN    ", substring(token, 1, 4),    "...\n")
    cat("HOST     ", host,     "\n")
    cat("USERNAME ", username, "\n")
    cat("PASSWORD ", password, "\n")
    cat("VERIFY_SSL ", verify_ssl, "\n")
    cat("\n")

    ## Check token or username set again?  done in .onAttach

    configuration <- list(api_key    = token,
                          username   = username,
                          password   = password,
                          host       = host,
                          verify_ssl = verify_ssl,
                          logged_in  = "FALSE")
    cat("CFG EXIT  ================================================================\n")
    configuration
}
