% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/array_info.R
\docType{class}
\name{ArrayInfo}
\alias{ArrayInfo}
\title{ArrayInfo}
\format{
An \code{R6Class} generator object
}
\description{
ArrayInfo Class
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{id}}{character [optional]}

\item{\code{file_type}}{\link{FileType} [optional]}

\item{\code{file_properties}}{named list( character ) [optional]}

\item{\code{uri}}{character [optional]}

\item{\code{namespace}}{character [optional]}

\item{\code{size}}{numeric [optional]}

\item{\code{last_accessed}}{character [optional]}

\item{\code{description}}{character [optional]}

\item{\code{name}}{character [optional]}

\item{\code{allowed_actions}}{list( \link{ArrayActions} ) [optional]}

\item{\code{pricing}}{list( \link{Pricing} ) [optional]}

\item{\code{subscriptions}}{list( \link{Subscription} ) [optional]}

\item{\code{logo}}{character [optional]}

\item{\code{access_credentials_name}}{character [optional]}

\item{\code{type}}{character [optional]}

\item{\code{share_count}}{numeric [optional]}

\item{\code{public_share}}{character [optional]}

\item{\code{namespace_subscribed}}{character [optional]}

\item{\code{tiledb_uri}}{character [optional]}

\item{\code{tags}}{list( character ) [optional]}

\item{\code{license_id}}{character [optional]}

\item{\code{license_text}}{character [optional]}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{ArrayInfo$new()}}
\item \href{#method-toJSON}{\code{ArrayInfo$toJSON()}}
\item \href{#method-fromJSON}{\code{ArrayInfo$fromJSON()}}
\item \href{#method-toJSONString}{\code{ArrayInfo$toJSONString()}}
\item \href{#method-fromJSONString}{\code{ArrayInfo$fromJSONString()}}
\item \href{#method-clone}{\code{ArrayInfo$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ArrayInfo$new(
  id = NULL,
  file_type = NULL,
  file_properties = NULL,
  uri = NULL,
  namespace = NULL,
  size = NULL,
  last_accessed = NULL,
  description = NULL,
  name = NULL,
  allowed_actions = NULL,
  pricing = NULL,
  subscriptions = NULL,
  logo = NULL,
  access_credentials_name = NULL,
  type = NULL,
  share_count = NULL,
  public_share = NULL,
  namespace_subscribed = NULL,
  tiledb_uri = NULL,
  tags = NULL,
  license_id = NULL,
  license_text = NULL,
  ...
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toJSON"></a>}}
\if{latex}{\out{\hypertarget{method-toJSON}{}}}
\subsection{Method \code{toJSON()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ArrayInfo$toJSON()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-fromJSON"></a>}}
\if{latex}{\out{\hypertarget{method-fromJSON}{}}}
\subsection{Method \code{fromJSON()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ArrayInfo$fromJSON(ArrayInfoJson)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-toJSONString"></a>}}
\if{latex}{\out{\hypertarget{method-toJSONString}{}}}
\subsection{Method \code{toJSONString()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ArrayInfo$toJSONString()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-fromJSONString"></a>}}
\if{latex}{\out{\hypertarget{method-fromJSONString}{}}}
\subsection{Method \code{fromJSONString()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ArrayInfo$fromJSONString(ArrayInfoJson)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ArrayInfo$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
