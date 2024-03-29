% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_array.R
\name{list_arrays}
\alias{list_arrays}
\title{Show listing of arrays}
\usage{
list_arrays(
  public = FALSE,
  shared = FALSE,
  page = NULL,
  per.page = NULL,
  search = NULL,
  namespace = NULL,
  orderby = NULL,
  permissions = NULL,
  tag = NULL,
  exclude.tag = NULL,
  file.type = NULL,
  exclude.file.type = NULL,
  file.property = NULL,
  ...
)
}
\arguments{
\item{public}{logical TRUE means list public arrays}

\item{shared}{logical TRUE means list shared arrays. If \code{public} and \code{shared} are both
false then arrays owned by you are listed.}

\item{page}{integer}

\item{per.page}{integer}

\item{search}{character}

\item{namespace}{character}

\item{orderby}{character}

\item{permissions}{character}

\item{tag}{list( character )}

\item{exclude.tag}{list( character )}

\item{file.type}{list( character )}

\item{exclude.file.type}{list( character )}

\item{file.property}{list( character )}
}
\value{
Dataframe of metadata for all arrays in your account that meet the filter applied.
}
\description{
Returns a dataframe of metadata for all arrays that meet the
filter applied.
}
\details{
Note that this is a paginable API but default params return all results on
one call, even hundreds of them. The \code{public} and
\code{shared} arguments may not both be true.

Pagination information is set as an attribute of the returned data frame.
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
\code{\link{get_udf_info}()},
\code{\link{group_info}()},
\code{\link{list_groups}()},
\code{\link{login}()},
\code{\link{register_array}()},
\code{\link{register_udf}()},
\code{\link{update_udf_info}()},
\code{\link{user_profile}()}
}
\concept{{manual-layer functions}}
