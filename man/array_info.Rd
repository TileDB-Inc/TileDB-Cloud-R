% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_array.R
\name{array_info}
\alias{array_info}
\title{Show information about an array on TileDB Cloud}
\usage{
array_info(namespace, arrayname)
}
\arguments{
\item{namespace}{Like "TileDB-Inc"}

\item{arrayname}{Like "quickstart_dense"}
}
\value{
A list of array properties
}
\description{
This function shows array information on TileDB Cloud.
}
\details{
Nominally you will first call \code{\link{login}}; if not, the results of
the last login at \code{~/.tiledb/cloud.json} will be used.
}
\seealso{
Other {manual-layer functions}: 
\code{\link{compute_sequentially}()},
\code{\link{compute}()},
\code{\link{delayed_args<-}()},
\code{\link{delayed_args}()},
\code{\link{delayed_array_udf}()},
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
