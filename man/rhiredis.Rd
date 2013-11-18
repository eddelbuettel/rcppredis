\name{rhiredis}
\alias{Redis}
\alias{Rcpp_Redis}
\alias{Rcpp_Redis-class}
\docType{package}
\title{Rcpp module using hiredis library to connect R to Redis}
\description{
  The \verb{Redis} module is created using Rcpp modules and wraps a
  minimal class \verb{Redis} around an Redis connection context object
  which permits bi-directional communication with a Redis in-memory database.

  New instances can be created using either a default constructor
  (using localhost and the default port) and either host and port, or
  just the host.

  Currently, the module has just one worker command which sends a string
  to the Redis instance and returns a string.
}
\details{
  Please consult the Redis documentation for details on the available
  commands. See the Rcpp-modules vignette for details on Rcpp modules. 
}
\author{Dirk Eddelbuettel \email{edd@debian.org}}
\references{Redis: \url{http://redis.io/commands}}
\keyword{package}