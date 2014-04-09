
suppressMessages(library(RcppRedis))
suppressMessages(library(rredis))

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)

redis <- new(Redis)
rredis::redisConnect(nodelay=TRUE)      # new rredis option to mimich networking behavior of hiredis

## set a serialized object
key <- "foo"
redis$set(key, serialize(fit,NULL,ascii=TRUE))


## retrieve with rredis
fit2 <- rredis::redisGet(key)

## check
all.equal(fit, fit2)


## or serialize an object internally 
key <- "foo2"
redis$set(key, fit)

## retrieve with rredis
fit3 <- rredis::redisGet(key)

## check
all.equal(fit, fit3)

## retrieve with rredis
fit4 <- redis$get(key)

## check
all.equal(fit, fit4)



                                 
                                 


