\name{redisConnect}
\alias{redisConnect}
\title{
  Convenience wrapper to connect to a redis server
}
\description{
  A convenience wrapper to connect to a redis server, especially if an AUTH,
  i.e., password, is required.
}
\usage{
redisConnect(host = "localhost", port = 6379, password = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{host}{The Redis server host name or inet address (optional, character). The default value is "localhost".}
  
  \item{port}{The Redis port number (optional, numeric or integer). The default value is 6379L.}
  
  \item{password}{Redis authentication password (if applicable)}
}

\value{
  The minimal class \verb{Redis}.
}
\author{
Russell S. Pierce
}
\examples{
## Not Run
# redisLocalhost <- redisConnect()
# redisRemotehostWithAuth <- redisConnect("192.168.1.200",password="myPassword")
}
