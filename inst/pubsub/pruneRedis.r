#!/usr/bin/env r

suppressMessages({
    library(anytime)
    library(RcppRedis)
    library(xts)
})

defaultTZ <- "America/Chicago"
host <- "localhost"
symbols <- c("BTC=F", "ES=F", "GC=F", "CL=F")

redis <- new(Redis, host)
if (redis$ping() != "PONG") stop("No Redis server?", call. = FALSE)

for (symbol in symbols) {
    m <- redis$zrange(symbol, 0, -1)
    colnames(m) <- c("Time", "Close", "Change", "PctChange", "Volume")
    y <- xts(m[,-1], order.by=anytime(as.numeric(m[,1])))
    if (as.numeric(index(y)[1], Sys.time(), units="days") > 30) {
        onemonthago <- Sys.time() - 60*60*24*31
        cutoff <- as.numeric(onemonthago)
        lastold <- max(which(m[, 1] < cutoff ))
        redis$zremrangebyscore(symbol, 0, m[lastold,1])
    }
}
