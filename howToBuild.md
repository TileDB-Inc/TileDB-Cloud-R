
## tiledbcloud

Work in progress

### How was this built

- using current (2020-Aug-07) Docker container
  `openapitools/openapi-generator-cli:latest`
- standard invocation using TileDB Cloud API Spec V1, setting package name
  and version
- involing `roxygen2` to build documentation

```sh
docker run --rm -u 1000:1000 -v $PWD:/work \
       openapitools/openapi-generator-cli:latest \
       generate -i /work/openapi-v1.yaml -g r \
       -p packageName=tiledbcloud -p packageVersion=0.0.1 -o /work/tiledb-cloud-r
cd tiledb-cloud-r && roxy.r -f   # simple roxygen2 wrapper from littler
```

### Demo

A few first commands (see [local/](local/) as well)

```r
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
```
