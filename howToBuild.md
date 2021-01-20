
## tiledbcloud

Work in progress

### How was this built

- using current (2020-Aug-07) Docker container `openapitools/openapi-generator-cli:latest`
- it appear to be depedent on this version as in Jan 2021 a newer container
  created issues for Andreas; the version we used is
  > openapi-generator-cli 5.0.0-SNAPSHOT
  >   commit : 0b529de
  >   built  : 2020-08-07T10:39:48Z
  >   source : https://github.com/openapitools/openapi-generator
  >   docs   : https://openapi-generator.tech/
  we will look into newer verions later
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

### Build and Test

```sh
R CMD build .                           # creates eg tiledbcloud_0.0.2.tar.gz
R CMD check tiledbcloud_0.0.2.tar.gz    # checks the package


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
