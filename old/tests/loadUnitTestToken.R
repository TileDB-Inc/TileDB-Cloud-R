
Sys.setenv("TILEDB_REST_USERNAME"="")
Sys.setenv("TILEDB_REST_PASSWORD"="")
if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "") Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)

library(tiledbcloud)

print(str(tiledbcloud:::.pkgenv[["api"]]$GetSession()))
print(str(tiledbcloud:::.pkgenv[["api"]]$GetUser()))
