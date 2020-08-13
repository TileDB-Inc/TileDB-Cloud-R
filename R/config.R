.loadConfig <- function() {
    ## should we use rappdirs? follow the XDG_CONFIG_HOME?
    homedir <- Sys.getenv("HOME")
    if (homedir == "") stop("Need to define HOME environment variable.")  # Windows ?
    cfgfile <- file.path(homedir, ".tiledb", "cloud.json")
    if (!file.exists(cfgfile)) {
        #message("No config file 'cloud.json' found.")
        return(invisible(NULL))
    }
    cfg <- jsonlite::fromJSON(cfgfile)
}

##' Configure TileDB Cloud
##'
##' Provide the setup configuration for the TileDB Cloud package.
##'
##' It considers four different environment variables:
##' \code{TILEDB_REST_TOKEN}, \code{TILEDB_REST_HOST},
##' \code{TILEDB_REST_USERNAME}, and \code{TILEDB_REST_PASSWORD}.
##'
##' It also reads a configuration file from a file
##' \code{.tiledb/cloud.json}
##'
##' To operate, \emph{either} an API token has to be provided and will
##' be used, \emph{or} the username and password combination will be
##' used to login with a new session.
##'
##' @return A named vector with configuration values is returned.
##' @import tiledb
config <- function() {

    ## start with environment variables; R returns "" if unset by default
    token      <- Sys.getenv("TILEDB_REST_TOKEN")
    host       <- Sys.getenv("TILEDB_REST_HOST")
    username   <- Sys.getenv("TILEDB_REST_USERNAME")
    password   <- Sys.getenv("TILEDB_REST_PASSWORD")
    verify_ssl <- TRUE

    cfg <- .loadConfig()
    if (!is.null(cfg)) {
        if ("username" %in% names(cfg))  username <- cfg$username
        if ("password" %in% names(cfg))  password <- cfg$password
        if (host == "")  host <- gsub("/v1(/)?$", "", cfg$host) # scrubs trailing /v1 or /v1/
        if (token == "" && !is.null(cfg$api_key[[1]])) token <- cfg$api_key
        verify_ssl <- cfg$verify_ssl
    }

    ## check token or username set again?  done in .onAttach

    ## fallback defaults
    if (host == "") host <- "https://api.tiledb.com"

    configuration <- c(api_key    = token,
                       username   = username,
                       password   = password,
                       host       = host,
                       verify_ssl = verify_ssl)
}

##' TileDB Cloud Login Helper
##'
##' This function can be used to override the default setup made at
##' package load.
##'
##' It can operate in two modes. Either, a username and a password are
##' supplied as environment variable \code{TILEDB_REST_USERNAME} and
##' \code{TILEDB_REST_PASSWORD}.  As an alternative, an access token
##' can be supplied via \code{TILEDB_REST_TOKEN}.  The values are used
##' to instantiate a new API client object. If no token was supplied a
##' new session is requested and the token assigned to that session is
##' used.
##'
##' Funtion arguments are optional, and can be used to override the
##' default configuration values obtained by \code{config()} from
##' either the environment variables or the configuration file.
##'
##' @param username A character value with the username, if present
##' password is also needed.
##'
##' @param password A character value with the password, if present
##' username is also needed.
##'
##' @param api_key A character value with the access token, it can be
##' used instead of username and password.
##'
##' @param host A character value with remote host to connect to.
##'
##' @param remember_me A boolean to select a session with for 24 hours
##' instead of 8 hours, used only when a new session is requested.
##'
##' @param verbose A boolean switch to select whether an warning message
##' is printed or not.
##'
##' @return Nothing is returned, the function is called for a side effect
##' of storing the values in the package environment
login <- function(username, password, api_key, host,
                  remember_me=TRUE, verbose=TRUE) {

    if (missing(username)) username <- .getConfigValue("username")
    if (missing(password)) password <- .getConfigValue("password")
    if (missing(api_key))  api_key  <- .getConfigValue("api_key")

                                        #print(c(usr=username,pwd=password,tok=token))
    good <- api_key != "" || (username != "" && password != "")
    if (!good && verbose) {
        warning("Need either 'username' + 'password', or 'api_key', ",
                "to create login session.")
        return(invisible(NULL))
    }

    cl <- ApiClient$new(basePath="https://api.tiledb.com/v1",
                        accessToken=api_key,
                        username=username,
                        password=password)

    api <- UserApi$new(cl)
    api$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- api_key
    #cat("usr='", username, "' pwd='", password, "' tok='", api_key, "'\n", sep="")

    ## if there is not api token key, request one
    if (api_key == "") {
        ## request a session
        sess <- api$GetSession(remember.me = remember_me)

        ## and proceed with the assigned token
        api_key <- sess$token
        api$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- api_key
        ## and store it
        .setConfigValue("api_key", api_key)
    }

    res <- api$GetUser()
    cat("GetUser() got name", res$name, "\n")

    ## we do not store username and password, but update
    .setConfigValue("username", "")
    .setConfigValue("password", "")

    invisible()
}
