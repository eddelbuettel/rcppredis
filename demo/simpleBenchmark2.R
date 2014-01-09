
suppressMessages(library(rhiredis))
suppressMessages(library(rredis))
suppressMessages(library(rbenchmark))

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)


redis <- new(Redis)
rredis::redisConnect(nodelay=TRUE)      # new rredis option to mimich networking behavior of hiredis

hiredis <- function() redis$exec(paste0("SET fits1 ",
                                        rawToChar(serialize(fit,NULL,ascii=TRUE))))

rredis <- function() rredis::redisSet("fits2", fit)

hiredisInt <- function() redis$exec(paste0("SET fits3 ", serializeToChar(fit))) 


res <- benchmark(hiredis(), rredis(), hiredisInt(), replications=500, order="relative")[,1:4]
print(res)

all.equal(unserialize(charToRaw(redis$exec("GET fits1"))), fit)
all.equal(rredis::redisGet("fits2"), fit)
all.equal(rredis::redisGet("fits3"), fit)


                                 
                                 


