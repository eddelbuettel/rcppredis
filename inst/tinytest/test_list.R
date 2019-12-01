#test_01_setup <- function() {
suppressMessages(library(RcppRedis))
redis <- new(Redis)

exampleNumericElement <- 1.0
exampleCharElement <- "a"
key <- "RcppRedis:test:mylist"
redis$exec(paste("del", key))


#test_02_lpush <- function() {
## add example elements to the list
n1 <- redis$lpush(key, exampleNumericElement)
n2 <- redis$lpush(key, exampleCharElement)
expect_equal(n1, 1)
expect_equal(n2, 2)


#test_03_lpop <- function() {
## remove example elements from the list
res1 <- redis$lpop(key)
res2 <- redis$lpop(key)
expect_equal(res1, exampleCharElement)
expect_equal(res2, exampleNumericElement)


#test_04_lpopnull <- function() {
## try to lpop beyond list extent
res <- redis$rpop(key)
expect_equal(res, NULL)


#test_05_rpush <- function() {
## add example elements to the list
n1 <- redis$rpush(key, exampleNumericElement)
n2 <- redis$rpush(key, exampleCharElement)
expect_equal(n1, 1)
expect_equal(n2, 2)


#test_06_rpop <- function() {
## remove example elements from the list
res1 <- redis$rpop(key)
res2 <- redis$rpop(key)
expect_equal(res1, exampleCharElement)
expect_equal(res2, exampleNumericElement)


#test_07_rpopnull <- function() {
## try to rpop beyond list extent
res <- redis$rpop(key)
expect_equal(res, NULL)


#test_08_ltrim <- function() {
##try to trim a list
redis$lpush(key, 1)
redis$lpush(key, 2)
redis$lpush(key, 3)
redis$ltrim(key, 0, 1)
res <- redis$lrange(key, 0, 100)
expect_equal(res,list(3,2))
redis$exec(paste("del", key))


#test_09_cleanup <- function() {
## delete key
n <- redis$exec(paste("del", key))
expect_equal(n, 0)
