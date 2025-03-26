#!/usr/bin/Rscript

suppressMessages(library(RcppRedis))
print(Redis)

## simple ping / pong test
redis <- new(Redis)
redis$exec("PING")
redis$exec("PING")

## set and retrieve a number
redis2 <- new(Redis, "127.0.0.1", 6379)
redis2$exec("SET testchannel 42")
redis2$exec("GET testchannel")

## set and retrieve a complete R object
data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)
redis$exec(paste("SET fits ", rawToChar(serialize(fit,NULL,ascii=TRUE)), sep=""))
all.equal(unserialize(charToRaw(redis$exec("GET fits"))), fit)
