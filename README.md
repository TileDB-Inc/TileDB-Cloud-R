# <a href="https://tiledb.com/"><img src="https://github.com/TileDB-Inc/TileDB/raw/dev/doc/source/_static/tiledb-logo_color_no_margin_@4x.png" alt="TileDB logo" width="400"></a>

[![Build Status](https://dev.azure.com/TileDB-Inc/CI/_apis/build/status/TileDB-Inc.TileDB-Cloud-R?branchName=master)](https://dev.azure.com/TileDB-Inc/CI/_build/latest?definitionId=26&branchName=master)

This repository contains the [R](https://www.r-project.org/) client for the [TileDB Cloud Service](https://tiledb.com/cloud).

## Installation

At present, installation from GitHub is supported via

```r
> if (!requireNamespace("remotes", quietly=TRUE)) install.packages("remotes")
> remotes::install_github("TileDB-Inc/TileDB-Cloud-R")
```

The [TileDB-R](https://github.com/TileDB-Inc/TileDB-R) package is a dependency and has 
to be installed first.

## Quickstart

See the [Quickstart](https://docs.tiledb.com/cloud/quickstart) section of the docs.

## Developer links

See vignettes in the Articles section.
