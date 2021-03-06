% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/organization.R
\docType{class}
\name{Organization}
\alias{Organization}
\title{Organization}
\format{
An \code{R6Class} generator object
}
\description{
Organization Class
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{id}}{character [optional]}

\item{\code{role}}{\link{OrganizationRoles} [optional]}

\item{\code{name}}{character}

\item{\code{created_at}}{character [optional]}

\item{\code{updated_at}}{character [optional]}

\item{\code{logo}}{character [optional]}

\item{\code{description}}{character [optional]}

\item{\code{users}}{list( \link{OrganizationUser} ) [optional]}

\item{\code{allowed_actions}}{list( \link{NamespaceActions} ) [optional]}

\item{\code{num_of_arrays}}{numeric [optional]}

\item{\code{enabled_features}}{list( character ) [optional]}

\item{\code{unpaid_subscription}}{character [optional]}

\item{\code{default_s3_path}}{character [optional]}

\item{\code{default_s3_path_credentials_name}}{character [optional]}

\item{\code{stripe_connect}}{character [optional]}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Organization$new()}}
\item \href{#method-toJSON}{\code{Organization$toJSON()}}
\item \href{#method-fromJSON}{\code{Organization$fromJSON()}}
\item \href{#method-toJSONString}{\code{Organization$toJSONString()}}
\item \href{#method-fromJSONString}{\code{Organization$fromJSONString()}}
\item \href{#method-clone}{\code{Organization$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Organization$new(
  name,
  id = NULL,
  role = NULL,
  created_at = NULL,
  updated_at = NULL,
  logo = NULL,
  description = NULL,
  users = NULL,
  allowed_actions = NULL,
  num_of_arrays = NULL,
  enabled_features = NULL,
  unpaid_subscription = NULL,
  default_s3_path = NULL,
  default_s3_path_credentials_name = NULL,
  stripe_connect = NULL,
  ...
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toJSON"></a>}}
\if{latex}{\out{\hypertarget{method-toJSON}{}}}
\subsection{Method \code{toJSON()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Organization$toJSON()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-fromJSON"></a>}}
\if{latex}{\out{\hypertarget{method-fromJSON}{}}}
\subsection{Method \code{fromJSON()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Organization$fromJSON(OrganizationJson)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toJSONString"></a>}}
\if{latex}{\out{\hypertarget{method-toJSONString}{}}}
\subsection{Method \code{toJSONString()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Organization$toJSONString()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-fromJSONString"></a>}}
\if{latex}{\out{\hypertarget{method-fromJSONString}{}}}
\subsection{Method \code{fromJSONString()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Organization$fromJSONString(OrganizationJson)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Organization$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
