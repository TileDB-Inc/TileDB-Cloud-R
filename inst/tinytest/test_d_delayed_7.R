# ================================================================
# See comments on test_delayed_1.R regarding filenames for these test cases.
# ================================================================

# Local and non-local test files are in separate files. This is to (a) validate
# correct functioning of non-cloud-dependent and cloud-dependent things; (b)
# separate what can be tested without and with cloud credentials.  Let's keep
# this separation of files.

# ----------------------------------------------------------------
library(tinytest)

if ((namespaceToCharge <- Sys.getenv("TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE")) == "") {
    exit_file("No TILEDB_REST_UNIT_TEST_NAMESPACE_TO_CHARGE in environment")
}

# ----------------------------------------------------------------
library(tiledbcloud)

# ----------------------------------------------------------------
# Delayed registered R generic UDF

# This one we require to be already registered in prod -- we don't dynamically register it,
# then test it, then deregister it. We'll do similarly for a Python UDF.
#
# In case this needs to be recreated in TileDB Cloud, here's how:
#
# myfunc <- function(vec, exponent) { sum(vec ** exponent) }
# register_udf(namespace='unittest', name='tiledb-cloud-r-generic-udf-r', type='generic', func=myfunc)

# Non-delayed
o <- execute_generic_udf(
  registered_udf_name='unittest/tiledb-cloud-r-generic-udf-r',
  args=list(vec=1:16, exponent=3),
  namespace=namespaceToCharge
)
expect_equal(o, 18496)

# Delayed
a <- delayed_generic_udf(
  registered_udf_name='unittest/tiledb-cloud-r-generic-udf-r',
  args=list(vec=1:16, exponent=3),
  name='my generic udf',
  namespace=namespaceToCharge
)
o <- compute(a)
expect_equal(o, 18496)

# ----------------------------------------------------------------
# Delayed registered R single-array UDF

# This one we require to be already registered in prod -- we don't dynamically register it,
# then test it, then deregister it. We'll do similarly for a Python UDF.
#
# In case this needs to be recreated in TileDB Cloud, here's how:
#
# myfunc <- function(df, attr, exponent) {
#   vec <- as.vector(df[[attr]])
#   sum(vec ** exponent)
# }
# register_udf(namespace='unittest', name='tiledb-cloud-r-single-array-udf-r', type='single_array', func=myfunc)

# Non-delayed
o <- execute_array_udf(
  array="TileDB-Inc/quickstart_dense",
  registered_udf_name='unittest/tiledb-cloud-r-single-array-udf-r',
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a"),
  args=list(attr="a", exponent=3),
  namespace=namespaceToCharge
)
expect_equal(o, 18496)

# Delayed
a <- delayed_array_udf(
  array="TileDB-Inc/quickstart_dense",
  registered_udf_name='unittest/tiledb-cloud-r-single-array-udf-r',
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a"),
  args=list(attr="a", exponent=3),
  name='my single-array udf',
  namespace=namespaceToCharge
)
o <- compute(a)
expect_equal(o, 18496)

# ----------------------------------------------------------------
# Delayed registered Python generic UDF

# This one we require to be already registered in prod -- we don't dynamically
# register it, then test it, then deregister it -- since it's a Python UDF.
#
# In case this needs to be recreated in TileDB Cloud, here's how:
#
# import tiledb, tiledb.cloud
# def myfunc(vec, exponent):
#   import numpy
#   # Cast from NumPy type to Python type so this can serialize via JSON/Arrow to R callers
#   return int(numpy.sum(numpy.array(vec) ** exponent))
# tiledb.cloud.udf.register_generic_udf(myfunc, name="tiledb-cloud-r-generic-udf-py", namespace="unittest")

# Non-delayed
o <- execute_generic_udf(
  registered_udf_name='unittest/tiledb-cloud-r-generic-udf-py',
  args=list(vec=1:16, exponent=3),
  language='python',
  namespace=namespaceToCharge
)
expect_equal(o, 18496)

# Delayed
a <- delayed_generic_udf(
  registered_udf_name='unittest/tiledb-cloud-r-generic-udf-py',
  args=list(vec=1:16, exponent=3),
  name='my generic udf',
  language='python',
  namespace=namespaceToCharge
)
o <- compute(a)
expect_equal(o, 18496)

# ----------------------------------------------------------------
# Delayed registered Python single-array UDF

# In case this needs to be recreated in TileDB Cloud, here's how:
#
# import tiledb, tiledb.cloud
# # 'df' is an OrderedDict from attribute name to multi-dimensional numpy.array.
# # OrderedDict([('a', array([[ 1,  2,  3,  4], [ 5,  6,  7,  8], [ 9, 10, 11, 12], [13, 14, 15, 16]], dtype=int32))])
# def myfunc(df, attr, exponent):
#   import numpy
#   # Cast from NumPy type to Python type so this can serialize via JSON/Arrow to R callers
#   return int(numpy.sum(df[attr] ** exponent))
# tiledb.cloud.udf.register_single_array_udf(myfunc, name="tiledb-cloud-r-single-array-udf-py", namespace="unittest")

# Non-delayed
o <- execute_array_udf(
  array="TileDB-Inc/quickstart_dense",
  registered_udf_name='unittest/tiledb-cloud-r-single-array-udf-py',
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a"),
  args=list(attr="a", exponent=3),
  language='python',
  namespace=namespaceToCharge
)
expect_equal(o, 18496)

# Delayed
a <- delayed_array_udf(
  array="TileDB-Inc/quickstart_dense",
  registered_udf_name='unittest/tiledb-cloud-r-single-array-udf-py',
  selectedRanges=list(cbind(1,4), cbind(1,4)),
  attrs=c("a"),
  args=list(attr="a", exponent=3),
  language='python',
  namespace=namespaceToCharge
)
o <- compute(a)
expect_equal(o, 18496)
