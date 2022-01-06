\name{listen}
\alias{listen}
\title{listen}
\description{Listen for messages on subscribed Redis message channels.}
\usage{
listen(context)
}
\arguments{
  \item{context}{ A valid Redis context (see example).  }
}
\details{(From the Redis.io documentation):
implement the Publish/Subscribe messaging paradigm where (citing Wikipedia)
senders (publishers) are not programmed to send their messages to specific
receivers (subscribers). Rather, published messages are characterized into
channels, without knowledge of what (if any) subscribers there may be.
Subscribers express interest in one or more channels, and only receive messages
that are of interest, without knowledge of what (if any) publishers there are.

WARNING: The \code{listen} function blocks indefinitely until a 
message is received.
}
\value{A three element list or an error, with elements "subscribe",
channel name, and message value.}
\references{
http://redis.io/commands
}
\author{
B. W. Lewis
}
\seealso{
\code{\link{redisMonitorChannels}}
}
\examples{
\dontrun{
x <- new(Redis)
y <- new(Redis)

# Subscribe to two example channels...
x$subscribe(c("channel1", "channel2"))
y$publish("channel1", pi)

# Receive a message (warning, can block indefinitely)...
listen(x)

# Unsubscribe...
x$unsubscribe(c("channel1", "channel2"))
}
}
