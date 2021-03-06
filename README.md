# TileDB-Cloud-R

[![Build Status](https://dev.azure.com/TileDB-Inc/CI/_apis/build/status/TileDB-Inc.TileDB-Cloud-R?branchName=master)](https://dev.azure.com/TileDB-Inc/CI/_build/latest?definitionId=26&branchName=master)

This repository contains the R client for the TileDB Cloud Service.

## Quick Links

### Installation

At present, installation from GitHub is supported via

```r
> if (!requireNamespace("remotes",quietly=TRUE)) install.packages("remotes")
> remotes::install_github("TileDB-Inc/TileDB-Cloud-R")
```

The [TileDB-R](https://github.com/TileDB-Inc/TileDB-R) package is a dependency and has 
to be installed first.

### Quickstart

See the [Quickstart](https://docs.tiledb.com/cloud/quickstart) section of the docs.
