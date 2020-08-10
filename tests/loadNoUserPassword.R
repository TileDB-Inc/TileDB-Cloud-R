
Sys.setenv("TILEDB_REST_USERNAME"="")
Sys.setenv("TILEDB_REST_PASSWORD"="")

library(tiledbcloud)

print(str(tiledbcloud:::.pkgenv[["api"]]$GetSession()))
