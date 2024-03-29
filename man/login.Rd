% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_layer_login.R
\name{login}
\alias{login}
\title{Log in to TileDB Cloud}
\usage{
login(
  username,
  password,
  api_key,
  host,
  remember_me = TRUE,
  write_config = FALSE
)
}
\arguments{
\item{username}{A character value with the username, if present
password is also needed.}

\item{password}{A character value with the password, if present
username is also needed.}

\item{api_key}{A character value with the access token, it can be
used instead of username and password.}

\item{host}{A character value with remote host to connect to.}

\item{remember_me}{A boolean to select a session with for 24 hours
instead of 8 hours, used only when a new session is requested.}

\item{write_config}{A boolean to write the login information
to \code{~/.tiledb/cloud.json} from where it can be read for
subsequent sessions. This is only done when requested by this
parameter, which is \code{FALSE} by default.}
}
\value{
Nothing is returned; the function is called for a side effect
of storing the values in the package environment.
}
\description{
This function can be used to override the default setup made at
package load.
}
\details{
It can operate in two modes. Either a username and a password are
supplied as environment variable \code{TILEDB_REST_USERNAME} and
\code{TILEDB_REST_PASSWORD}.  As an alternative, an access token
can be supplied via \code{TILEDB_REST_TOKEN}.  The values are used
to instantiate a new API client object. If no token was supplied, a
new session is requested and the token assigned to that session is
used.

Function arguments are optional, and can be used to override the
default configuration values obtained by \code{\link{configure}} from
either the environment variables or the configuration file.
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
\code{\link{list_arrays}()},
\code{\link{list_groups}()},
\code{\link{register_array}()},
\code{\link{register_udf}()},
\code{\link{update_udf_info}()},
\code{\link{user_profile}()}
}
\concept{{manual-layer functions}}
