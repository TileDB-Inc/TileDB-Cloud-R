
## tiledbcloud

Work in progress

### How was this built

- initially using then-current (2020-Aug-07) Docker container `openapitools/openapi-generator-cli:latest`
- now via the offical v5.0.0 release `openapitools/openapi-generator-cli:v5.0.0`
- standard invocation using TileDB Cloud API Spec V1, setting package name and version
- one (very important) fix to `R/api_client.R` (see below)
- involing `roxygen2` to build documentation followed by a one-word fix to one Rd file


```sh
docker run --rm -u 1000:1000 -v $PWD:/work \
       openapitools/openapi-generator-cli:latest \
       generate -i /work/openapi-v1.yaml -g r \
       -p packageName=tiledbcloud -p packageVersion=0.0.3 -o /work/tiledbcloud-generated
cd tiledbcloud-generated && Rscript -e 'roxygen2::roxygenize(".", roclets=NULL)'
```

*Important* The generated API wants to also parse a field `User` which we
apparently do not send. So the default deserializer breaks. See PR #2 and its
small diff to `R/api_client.R` file for a fix that needs to be re-applied.



### Build and Test

```sh
R CMD build .                           # creates eg tiledbcloud_0.0.2.tar.gz
R CMD check tiledbcloud_0.0.3.tar.gz    # checks the package


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
