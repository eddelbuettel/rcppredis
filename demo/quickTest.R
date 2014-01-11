
suppressMessages(library(rhiredis))
suppressMessages(library(rredis))

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)

redis <- new(Redis)
rredis::redisConnect(nodelay=TRUE)      # new rredis option to mimich networking behavior of hiredis

## write with setRaw()
key <- "foo"
redis$set(key, serialize(fit,NULL,ascii=TRUE))

## retrieve with rredis
fit2 <- rredis::redisGet(key)

## check
all.equal(fit, fit2)


## write with setRaw(), our serialize
key <- "foo2"
redis$set(key, serializeToRaw(fit))

## retrieve with rredis
fit3 <- rredis::redisGet(key)

## check
all.equal(fit, fit3)



                                 
                                 


