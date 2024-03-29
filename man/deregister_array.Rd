% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_array.R
\name{deregister_array}
\alias{deregister_array}
\title{Deregister an array from TileDB Cloud}
\usage{
deregister_array(namespace = NULL, array_name)
}
\arguments{
\item{namespace}{Namespace within TileDB cloud to charge. If this is null, the
logged-in user's username will be used for the namespace.}

\item{array_name}{The name to call the array in TileDB Cloud.}
}
\description{
The underlying storage will not be removed.
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
