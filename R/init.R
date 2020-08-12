
.pkgenv <- new.env(parent=emptyenv())

.onLoad <- function(libname, pkgname) {
    ## we can use _either_ a username and password _or_ a token
    #.pkgenv[["tok"]] <- tok <- Sys.getenv("TILEDB_REST_TOKEN")
    #.pkgenv[["usr"]] <- usr <- Sys.getenv("TILEDB_REST_USERNAME")
    #.pkgenv[["pwd"]] <- pwd <- Sys.getenv("TILEDB_REST_PASSWORD")

    #.pkgenv[["cl"]] <- cl <- ApiClient$new(basePath="https://api.tiledb.com/v1",
    #                                       accessToken=tok,
    #                                       username=usr,
    #                                       password=pwd)

    #.pkgenv[["api"]] <- UserApi$new(cl)
    #.pkgenv[["api"]]$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- tok
    login(username=Sys.getenv("TILEDB_CLOUD_USERNAME"),
          password=Sys.getenv("TILEDB_CLOUD_PASSWORD"),
          token=Sys.getenv("TILEDB_REST_TOKEN"),
          remember_me=TRUE,
          verbose=FALSE)
}

.onAttach <- function(libname, pkgname) {
    #tok <- .pkgenv[["tok"]]
    #usr <- .pkgenv[["usr"]]
    #pwd <- .pkgenv[["pwd"]]
    #good <- tok != "" || (usr != "" && pwd != "")
    #if (!good) {
    #    packageStartupMessage(paste("The TileDB Cloud R integration needs either a token,",
    #                                "or a username and password, to operate."))
    #}
}

##' TileDB Cloud Login Helper
##'
##' This function can be used to override the default setup made at package load.
##' It can operate in two modes. Either, a username and a password are supplied as
##' environment variable \code{TILEDB_REST_USERNAME} and \code{TILEDB_REST_PASSWORD}.
##' As an alternative, an access token can be supplied via \code{TILEDB_REST_TOKEN}.
##' The values are used to instantiate a new API client object. If no token was supplied
##' a new session is requested and the token assigned to that session is used.
##' @title Set up TileDB Cloud Login Information
##' @param username A character value with the username, if present password is also needed.
##' @param password A character value with the password, if present username is also needed.
##' @param token A character value with the access token, it can be used instead of username
##' and password.
##' @param remember_me A boolean to select a session with for 24 hours instead of 8 hours, used
##' only when a new session is requested.
##' @param verbose A boolean switch to select whether an warning message is printed or not.
##' @return Nothing is returned, the function is called for a side effect of storing the
##' values in the package environment
login <- function(username="", password="", token="", remember_me=TRUE, verbose=TRUE) {
    #print(c(usr=username,pwd=password,tok=token))
    good <- token != "" || (username != "" && password != "")
    if (!good && verbose) {
        warning("Need either 'username' + 'password', or 'token', to create login session.")
        return(invisible(NULL))
    }

    cl <- ApiClient$new(basePath="https://api.tiledb.com/v1",
                        accessToken=token,
                        username=username,
                        password=password)

    api <- UserApi$new(cl)
    api$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- token
    #cat("usr='", username, " 'pwd='", password, "' tok='", token, "'\n", sep="")

    ## FIXME: something goes wrong with setting the environment up earlier and
    ## this on-demand logic. Requesting a token works, see local/getToken.R
    if (token == "") {
        ## request a session
        #cat("** requesting session\n")
        #print(api$apiclient$username)# <- username
        #print(api$apiclient$password)# <- password
        #sess <- api$GetSession(remember.me = remember_me)

        ## and proceed with the assigned token
        #token <- sess$token
    }

    ## we do not store username and password
    .pkgenv[["usr"]] <- ""
    .pkgenv[["pwd"]] <- ""
    .pkgenv[["tok"]] <- token
    .pkgenv[["cl"]] <- cl

    .pkgenv[["api"]] <- api
    .pkgenv[["api"]]$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- token
    #cat("usr=", "", " pwd=", "", " tok=", token, "\n", sep="")

    invisible()
}
