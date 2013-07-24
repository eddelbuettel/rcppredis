
library(rhiredis)
library(rredis)
library(rbenchmark)

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)

rawfit <- rawToChar(serialize(fit,NULL,ascii=TRUE))

redis <- new(Redis)
rredis::redisConnect()

hiredis <- function() redis$exec(paste("SET fits1 ",
                                       rawToChar(serialize(fit,NULL,ascii=TRUE)),
                                       sep=""))
rredis <- function() rredis::redisSet("fits2", fit)

res <- benchmark(hiredis(), rredis(), replications=100)[,1:4]
print(res)

all.equal(unserialize(charToRaw(redis$exec("GET fits1"))), fit)
all.equal(rredis::redisGet("fits2"), fit)



