\name{RcppRedis}
\alias{Redis}
\alias{Rcpp_Redis}
\alias{Rcpp_Redis-class}
\alias{serializeToChar}
\alias{unserializeFromChar}
\alias{serializeToRaw}
\alias{unserializeFromRaw}
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

  The helper functions \code{serializeToChar()} and
  \code{unserializeFromChar} convert R objects to/from a character
  representation (and internalize the conversion from \code{raw}
  to \code{char} representation at the compiled level).
  The helper functions \code{serializeToRaw()} and
  \code{unserializeFromRaw} convert R objects to/from raw vectors.

}
\details{
  Please consult the Redis documentation for details on the available
  commands. See the Rcpp-modules vignette for details on Rcpp modules. 
}
\author{Dirk Eddelbuettel \email{edd@debian.org}}
\keyword{package}
