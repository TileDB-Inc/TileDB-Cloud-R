if ((unitTestToken <- Sys.getenv("TILEDB_REST_UNIT_TEST_TOKEN")) != "") {
    Sys.setenv("TILEDB_REST_TOKEN"=unitTestToken)
} else {
    if (!file.exists("~/.tiledb/cloud.json")) exit_file("No authentication")
}

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

library(tiledbcloud)
library(tinytest)

# ----------------------------------------------------------------
if (!tiledbcloud:::.logged_in()) exit_file("not logged in")

# ----------------------------------------------------------------
make_udf_name <- function(base) {
  paste(base, floor(as.numeric(Sys.time())), floor(runif(1, min = 100000, max = 999999)), sep="_")
}

# ================================================================
udfname <- make_udf_name('udf-registration-test-multi-array')

myfunc <- function(df1, df2, attrname) {
  vec1 <- as.vector(df1[[attrname]])
  vec2 <- as.vector(df2[[attrname]])
  list(
    len=length(vec1) + length(vec2),
    min=min(vec1) + min(vec2),
    med=median(vec1) + median(vec2),
    max=max(vec1) + max(vec2)
  )
}

tiledbcloud::register_udf(namespace=namespaceToCharge, name=udfname, type='multi_array', func=myfunc)

info <- tiledbcloud::get_udf_info(namespace=namespaceToCharge, name=udfname)
expect_equal(info$name, udfname)

tiledbcloud::update_udf_info(namespace=namespaceToCharge, name=udfname, type='multi_array', func=myfunc, tags=list("testing", "udf", "upload"), readme='Here is the README text', version='2.0')

info <- tiledbcloud::get_udf_info(namespace=namespaceToCharge, name=udfname)
expect_equal(info$name, udfname)
expect_equal(info$readme, 'Here is the README text')
# Written as list(...), read back as c(...) -- this is expected.
expect_equal(info$tags, c("testing", "udf", "upload"))

# ----------------------------------------------------------------
details1 <- tiledbcloud::UDFArrayDetails$new(
  uri="tiledb://TileDB-Inc/quickstart_dense",
  ranges=QueryRanges$new(
    layout=Layout$new('row-major'),
    ranges=list(cbind(1,4),cbind(1,4))
  ),
  buffers=list("a")
)

details2 <- tiledbcloud::UDFArrayDetails$new(
  uri="tiledb://TileDB-Inc/quickstart_sparse",
  ranges=QueryRanges$new(
    layout=Layout$new('row-major'),
    ranges=list(cbind(1,2),cbind(1,4))
  ),
  buffers=list("a")
)

registered_udf_name=paste(namespaceToCharge, udfname, sep='/')
result <- tiledbcloud::execute_multi_array_udf(
  namespace=namespaceToCharge,
  array_list=list(details1, details2),
  registered_udf_name=registered_udf_name,
  args=list(attrname="a")
)
expect_equal(result, list(len=19, min=2, med=10.5, max=19))

# ----------------------------------------------------------------
tiledbcloud::deregister_udf(namespace=namespaceToCharge, name=udfname)
