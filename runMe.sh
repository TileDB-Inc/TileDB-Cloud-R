#!/bin/bash

if [ -h openapi-v1.yaml ]; then
    echo "Found openapi-v1.yaml link. We need a file."
elif [ -f openapi-v1.yaml ]; then
    echo "Found openapi-v1.yaml file"
else
    echo "No openapi-v1.yaml here"
    exit -1
fi

docker run --rm -u 1000:1000 -v $PWD:/work \
       openapitools/openapi-generator-cli:v5.0.0 \
       generate -i /work/openapi-v1.yaml -g r \
       -p packageName=tiledbcloud -p packageVersion=0.0.3 \
       -o /work/tiledbcloud-generated

echo "** Comparing R/ and tests/testthat/ and man/ (after roxygenize-ing)  [DRY RUNS]"
rsync --delete \
  --exclude=init.R \
  --exclude=configure.R \
  --exclude=user_layer.R \
  --exclude=login.R \
  --exclude=execute.R \
  --exclude=responses.R \
  -ncav tiledbcloud-generated/R/ R/
rsync --delete -ncav tiledbcloud-generated/tests/testthat/ tests/testthat/
## after roxygen update of man/ inside of tiledb-cloud-r/
rsync --exclude=login.Rd --exclude=config.Rd --delete -ncav tiledbcloud-generated/man/ man/


echo "Done. Remember to adjust api_client for the User field."
