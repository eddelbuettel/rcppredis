#!/usr/bin/Rscript

library(methods)
library(RcppRedis)

redis <- new(Redis)

key1 <- "ex:ascii:simpleString"
val1 <- redis$getString(key1)
cat("Got", val1, "from", key1, "\n")

key2 <- "ex:ascii:scalarVal"
val2 <- redis$listLPop(key2)
cat("Got", val2, "from", key2, "\n")

key3 <- "ex:ascii:vectorVal"
val3 <- redis$listLPop(key3)
cat("Got from", key3, "\n")
print(str(val3))

key4 <- "ex:ascii:vectorVal"
val4 <- redis$listRangeAsStrings(key4, 0, -1)
cat("Got from", key4, "\n")
print(val4)


