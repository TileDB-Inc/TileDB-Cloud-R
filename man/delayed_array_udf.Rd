% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_delayed.R
\name{delayed_array_udf}
\alias{delayed_array_udf}
\title{Define a single-array UDF to be executed within a task graph}
\usage{
delayed_array_udf(
  array,
  udf = NULL,
  registered_udf_name = NULL,
  selectedRanges,
  attrs,
  layout = NULL,
  args = NULL,
  result_format = "native",
  name = NULL,
  namespace = NULL,
  language = "r"
)
}
\arguments{
\item{array}{TileDB URI -- see vignette for examples.}

\item{udf}{User-defined function, as in UDF examples. Arguments are specified separately via \code{args}.
One of \code{udf} and \code{registered_udf_name} must be non-null.}

\item{registered_udf_name}{Name of a registered UDF, of the form \code{namespace/udfname}.
Arguments are specified separately via \code{args}.  One of \code{udf} and
\code{registered_udf_name} must be non-null.}

\item{selectedRanges}{As in UDF examples.}

\item{attrs}{As in UDF examples.}

\item{layout}{As in UDF examples.}

\item{result_format}{As in UDF examples.}

\item{name}{A display name for the query}

\item{namespace}{If supplied, a namespace to use for executing this particular node.
If omitted, a namespace can be applied at your top-level call to \code{compute}.
If omitted there as well, your logged-in account's default namespace will be used.}

\item{language}{If omitted, defaults to \code{"r"}. Can be set to \code{"python"}}
}
\value{
The return value from the UDF as an R object.
}
\description{
Define a single-array UDF to be executed within a task graph
}
\seealso{
Other {manual-layer functions}: 
\code{\link{array_info}()},
\code{\link{compute_sequentially}()},
\code{\link{compute}()},
\code{\link{delayed_args<-}()},
\code{\link{delayed_args}()},
\code{\link{delayed_generic_udf}()},
\code{\link{delayed_sql}()},
\code{\link{delayed}()},
\code{\link{deregister_array}()},
\code{\link{deregister_group}()},
\code{\link{deregister_udf}()},
\code{\link{execute_array_udf}()},
\code{\link{execute_generic_udf}()},
\code{\link{execute_multi_array_udf}()},
\code{\link{execute_sql_query}()},
\code{\link{get_udf_info}()},
\code{\link{group_info}()},
\code{\link{list_arrays}()},
\code{\link{list_groups}()},
\code{\link{login}()},
\code{\link{register_array}()},
\code{\link{register_udf}()},
\code{\link{update_udf_info}()},
\code{\link{user_profile}()}
}
\concept{{manual-layer functions}}
