
library(tiledbcloud)

cl <- ApiClient$new(basePath="https://api.tiledb.com/v1",
                    accessToken=Sys.getenv("TILEDB_REST_TOKEN"),
                    username=Sys.getenv("TILEDB_REST_USENAME"),
                    password=Sys.getenv("TILEDB_REST_PASSWORD"))

api <- UserApi$new(cl)
# still needs this
api$apiClient$apiKeys['X-TILEDB-REST-API-KEY'] <- Sys.getenv("TILEDB_REST_TOKEN")
## alternative if no 'ApiClient' instance
##api$apiClient$username <- Sys.getenv("TILEDB_REST_USENAME")
##api$apiClient$password <- Sys.getenv("TILEDB_REST_PASSWORD")
##api$apiClient$basePath <- "https://api.tiledb.com/v1"
api$GetSession()


## Array Example

arr <- ArrayApi$new(cl)
arr$GetArrayMetadata("TileDB-Inc", "quickstart_dense")


## SQL Example

sql <- SqlApi$new(cl)
sqlpar <-  SQLParameters$new(name="SomethingToFillInHere",
                             query="select `rows`, AVG(a) as avg_a from `tiledb://TileDB-Inc/quickstart_dense` GROUP BY `rows`")
ans <- sql$RunSQL("TileDB-Inc", sqlpar)

data.table::rbindlist( ans )            # easiest helper to glue rows together
