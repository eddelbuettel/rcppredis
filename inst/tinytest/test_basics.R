
#test_01_setup <- function() {
suppressMessages({
    library(datasets)
    library(rredis)
    library(RcppRedis)
})

rredis::redisConnect(nodelay=FALSE) 	# rredis connection object, but no tcpdelay
                                        # as our use of hiredis seesm to interfere

redis <- new(Redis)                	# RcppRedis object

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)


#test_02_treesExternalSerialize <- function() {

## set a externally serialized object
key <- "RcppRedis:test:foo"
redis$set(key, serialize(fit, NULL, ascii=TRUE))

## retrieve with rredis
fit2 <- rredis::redisGet(key)

## check
expect_equal(fit, fit2)


#test_03_treesInternalSerialize <- function() {
## or serialize an object internally
key <- "RcppRedis:test:foo2"
redis$set(key, fit)

## retrieve with rredis
fit3 <- rredis::redisGet(key)

## check
expect_equal(fit, fit3)


#test_04_treesRRedis <- function() {
## retrieve with rredis
key <- "RcppRedis:test:foo2"
fit4 <- redis$get(key)

## check
expect_equal(fit, fit4)


#test_05_ping <- function() {
res <- redis$ping()
expect_equal(res, "PONG")

#test_06_cleanup <- function() {
expect_equal(redis$exec("del RcppRedis:test:foo"), 1)
expect_equal(redis$exec("del RcppRedis:test:foo2"), 1)
