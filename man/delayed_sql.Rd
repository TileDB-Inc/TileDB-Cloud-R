% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_delayed.R
\name{delayed_sql}
\alias{delayed_sql}
\title{Define a SQL query function to be executed within a task graph}
\usage{
delayed_sql(query, name = NULL, namespace = NULL)
}
\arguments{
\item{query}{SQL query string -- see vignette for examples}

\item{name}{A display name for the query}

\item{namespace}{If supplied, the TileDB-Cloud namespace to charge the query to.
If omitted, a namespace can be applied at your top-level call to \code{compute}.
If omitted there as well, your logged-in account's default namespace will be used.}
}
\value{
A task-graph node object on which you can later call \code{compute}.  The return value from
compute() will be the query result as a dataframe.  Note that results will be strings, so numerical
results will need to be explicitly cast as such.
}
\description{
Define a SQL query function to be executed within a task graph
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
