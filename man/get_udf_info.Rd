% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_udf.R
\name{get_udf_info}
\alias{get_udf_info}
\title{Get information about a UDF on TileDB Cloud}
\usage{
get_udf_info(name, namespace)
}
\arguments{
\item{name}{Name of the UDF in TileDB Cloud, e.g. \code{myudfname}.}

\item{namespace}{Namespace for the UDF in TileDB Cloud, e.g. \code{mynamespace}.}
}
\value{
List of key-value pairs of UDF information.
}
\description{
Reads back information for a specified user-defined function on TileDB Cloud.
Note that \code{version}, \code{image_name}, \code{exec}, and \code{exec_raw}
are writable via \code{register_udf} but are not read back by this function.
}
\seealso{
Other {manual-layer functions}: 
\code{\link{array_info}()},
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
