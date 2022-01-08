\name{redisMonitorChannels}
\alias{redisMonitorChannels}
\title{redisMonitorChannels}
\description{Listen for messages on subscribed Redis message channels.}
\usage{
redisMonitorChannels(context, type=c("rdata", "raw", "string"))
}
\arguments{
  \item{context}{ A valid Redis context (see example).  }
  \item{type}{ The expected message value type.  }
}
\details{(From the Redis.io documentation):
implement the Publish/Subscribe messaging paradigm where (citing Wikipedia)
senders (publishers) are not programmed to send their messages to specific
receivers (subscribers). Rather, published messages are characterized into
channels, without knowledge of what (if any) subscribers there may be.
Subscribers express interest in one or more channels, and only receive messages
that are of interest, without knowledge of what (if any) publishers there are.

The \code{redisMonitorChannels} function may be called repeatedly in an
event loop to service messages on all subscribed channels. When a message
is received, the \code{redisMonitorChannels} function will attempt to
evaluate a callback function with same name as the channel, with the message
as its single argument. If no such function can be found, the message is
returned. See the help page for \code{redisGetResponse} for a description
of the message format.

WARNING: The \code{redisMonitorChannels} function blocks indefinitely until a 
message is received.

Use the lower-level \code{listen} context method to simply poll channels
for messages without evaluating function callbacks.
}
\value{The result of an evaluated function callback message, or if
no matching callback exists, the message.}
\references{
http://redis.io/commands
}
\author{
B. W. Lewis
}
\examples{
\dontrun{
x <- new(Redis)
y <- new(Redis)

# Define a callback function to process messages from channel 1:
channel1 <- function(x) {
  cat("Message received from channel 1: ",x,"\n")
}
# Define a callback function to process messages from channel 2:
channel2 <- function(x) {
  cat("Message received from channel 2: ",x,"\n")
}

# Subscribe to the channels...
x$subscribe(c("channel1", "channel2"))
y$publish("channel2", pi)

redisMonitorChannels(x)

# Unsubscribe
x$unsubscribe(c("channel1", "channel2"))
}
}

