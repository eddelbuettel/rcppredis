#!/usr/bin/Rscript

suppressMessages(library(Rhiredis))
print(Redis)

redis <- new(Redis)
print(redis)
redis$exec("PING")
redis$exec("PING")
redis$exec("PING")

redis2 <- new(Redis, "127.0.0.1", 6379)
redis2$exec("SET testchannel 42")
redis2$exec("GET testchannel")
