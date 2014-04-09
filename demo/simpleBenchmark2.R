
suppressMessages(library(RcppRedis))
suppressMessages(library(rredis))
suppressMessages(library(rbenchmark))

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)


redis <- new(Redis)
rredis::redisConnect(nodelay=TRUE)      # new rredis option to mimich networking behavior of hiredis

## writes as ascii
hiredis <- function() redis$exec(paste0("SET fits1 ",
                                        rawToChar(serialize(fit,NULL,ascii=TRUE))))

## writes as binary
rredis <- function() rredis::redisSet("fits2", fit)

## writes as binary
hiredisInt <- function() redis$set("fits3", fit) 


res <- benchmark(hiredis(), rredis(), hiredisInt(), replications=500, order="relative")[,1:4]
cat("\nResults for SET\n")
print(res)

stopifnot(all.equal(unserialize(charToRaw(redis$exec("GET fits1"))), fit))
stopifnot(all.equal(rredis::redisGet("fits2"), fit))
stopifnot(all.equal(rredis::redisGet("fits3"), fit))


                                 
hiredis <- function() unserialize(charToRaw(redis$exec("GET fits1")))

rredis <- function() rredis::redisGet("fits2")

hiredisInt <- function() redis$get("fits3") 


res <- benchmark(hiredis(), rredis(), hiredisInt(), replications=500, order="relative")[,1:4]
cat("\nResults for GET\n")
print(res)
                                 



