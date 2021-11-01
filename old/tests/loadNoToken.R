
Sys.setenv("TILEDB_REST_TOKEN"="")

library(tiledbcloud)

print(str(tiledbcloud:::.pkgenv[["api"]]$GetSession()))
