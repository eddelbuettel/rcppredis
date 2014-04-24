#!/usr/bin/Rscript

library(methods)
library(RcppRedis)

redis <- new(Redis)

key1 <- "ex:simpleString"
val1 <- redis$getString(key1)
cat("Got", val1, "from", key1, "\n")

#key2 <- "scalarVal"
#val2 <- redis$listRange(key2, 0, -1)
#cat("Got", val2, "from", key2, "\n")
#print(str(val2))

#key3 <- "vectorVal"
#val3 <- redis$listRange(key3, 0, -1)
#cat("Got", val2, "from", key2, "\n")
#print(str(val3))

key4 <- "ex:vectorVal"
val4 <- redis$listRangeAsStrings(key4, 0, -1)
cat("Got from", key4, "\n")
print(val4)


