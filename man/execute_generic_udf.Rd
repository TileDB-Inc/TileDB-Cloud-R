% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/execute.R
\name{execute_generic_udf}
\alias{execute_generic_udf}
\title{TileDB Cloud UDF-Execution Helper}
\usage{
execute_generic_udf(namespace, udf, args = NULL)
}
\arguments{
\item{namespace}{Namespace within TileDB cloud.}

\item{udf}{An R function. TODO: more context here on that function's
signature.}

\item{args}{Arguments to the function. If the function takes
no arguments, this can be omitted. If you want to call by
position, use a list like \code{args=list(123, 456)}. If you want
to call by name, use a named list like \code{args=list(x=123,y=456)}.}
}
\value{
The R object which is the return value from the UDF.
}
\description{
This function invokes a user-defined function in TileDB Cloud.
Nominally you will first call login(); if not, the results
of the last login at ~/.tiledb/cloud.json will be used.
}
\details{
The udf and namespace arguments are required; the args argument is
optional.
}