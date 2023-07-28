# tiledbcloud v0.0.11

* Added a `NEWS.md` file to track changes to the package.
* Added support for listing TileDB Cloud groups with `list_groups()`.
* Data frames returned by `list_groups()` and `list_arrays()` now include pagination information in the `pagination_metadata` attribute.
* Arrow Tables are now returned from UDFs when `result_format = "arrow"`.
