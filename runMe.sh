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
       openapitools/openapi-generator-cli:latest \
       generate -i /work/openapi-v1.yaml -g r \
       -p packageName=tiledbcloud -p packageVersion=0.0.2 \
       -o /work/tiledb-cloud-r

echo "** Comparing R/ and tests/testthat/"
rsync --delete --exclude=init.R --exclude=config.R --exclude=login.R -ncav tiledb-cloud-r/R/ R/
rsync --delete -ncav tiledb-cloud-r/tests/testthat/ tests/testthat/

echo "Done"
