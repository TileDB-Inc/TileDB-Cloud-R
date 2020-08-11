
.pkgenv <- new.env(parent=emptyenv())

.onLoad <- function(libname, pkgname) {
    ## we can use _either_ a username and password _or_ a token
    .pkgenv[["tok"]] <- tok <- Sys.getenv("TILEDB_REST_TOKEN")
    .pkgenv[["usr"]] <- usr <- Sys.getenv("TILEDB_REST_USERNAME")
    .pkgenv[["pwd"]] <- pwd <- Sys.getenv("TILEDB_REST_PASSWORD")

    .pkgenv[["cl"]] <- cl <- ApiClient$new(basePath="https://api.tiledb.com/v1",
                                           accessToken=tok,
                                           username=usr,
                                           password=pwd)

    .pkgenv[["api"]] <- UserApi$new(cl)
    .pkgenv[["api"]]$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- tok

}

.onAttach <- function(libname, pkgname) {
    tok <- .pkgenv[["tok"]]
    usr <- .pkgenv[["usr"]]
    pwd <- .pkgenv[["pwd"]]
    good <- tok != "" || (usr != "" && pwd != "")
    if (!good) {
        packageStartupMessage(paste("The TileDB Cloud R integration needs either a token,",
                                    "or a username and password, to operate."))
    }
}
