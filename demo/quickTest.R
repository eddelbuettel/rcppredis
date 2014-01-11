
suppressMessages(library(rhiredis))
suppressMessages(library(rredis))

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)

redis <- new(Redis)
rredis::redisConnect(nodelay=TRUE)      # new rredis option to mimich networking behavior of hiredis

## write with setRaw()
key <- "foo"
rhiredis::setRaw(key, serialize(fit,NULL,ascii=TRUE))

## retrieve with rredis
fit2 <- rredis::redisGet(key)

## check
all.equal(fit, fit2)


                                 
                                 


