#!/usr/bin/Rscript

library(methods)
library(RcppRedis)

redis <- new(Redis)

key1 <- "ex:ascii:simpleString"
val1 <- "abracadrabra"
res <- redis$setString(key1, val1)
cat("Wrote", val1, "for", key1, "with result", res, "\n")

#key2 <- "scalarVal"
#val2 <- redis$listRange(key2, 0, -1)
#cat("Got", val2, "from", key2, "\n")
#print(str(val2))

#key3 <- "vectorVal"
#val3 <- redis$listRange(key3, 0, -1)
#cat("Got", val2, "from", key2, "\n")
#print(str(val3))

#key4 <- "vectorVal"
#val4 <- redis$listRangeAsStrings(key4, 0, -1)
#print(val4)
