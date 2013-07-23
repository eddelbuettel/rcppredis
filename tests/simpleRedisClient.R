#!/usr/bin/Rscript

suppressMessages(library(Rhiredis))

redis("PING")
redis("PING")
redis("PING")

redis("SET testchannel 42")
redis("GET testchannel")
