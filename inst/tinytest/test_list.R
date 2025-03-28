#test_01_setup <- function() {
suppressMessages(library(RcppRedis))
redis <- new(Redis)

exampleNumericElement <- 1.0
exampleCharElement <- "a"
key <- "RcppRedis:test:mylist"
expect_equal(redis$del(key), 0)


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
expect_equal(redis$del(key), 1)


#test_09_cleanup <- function() {
## delete key
expect_equal(redis$del(key), 0)


## check lrem
redis$del(key)
elem <- "abc"
redis$lpush(key, elem)
redis$lpush(key, elem)
redis$lpush(key, elem)
redis$lpush(key, elem)
expect_equal(redis$llen(key), 4)
redis$lrem(key, 1, elem)
expect_equal(redis$llen(key), 3)
redis$lrem(key, -1, elem)
expect_equal(redis$llen(key), 2)
expect_equal(redis$lpop(key), elem)
expect_equal(redis$lpop(key), elem)
expect_equal(redis$keys(key), character())

## check lmove
altkey <- "RcppRedis:test:myotherlist"
redis$del(altkey)
redis$rpush(key, 1)
redis$rpush(key, 2)
redis$rpush(key, 3)
redis$lmove(key, altkey, "LEFT", "RIGHT")
expect_equal(redis$llen(key), 2)
expect_equal(redis$llen(altkey), 1)
redis$lmove(key, altkey, "LEFT", "LEFT")
expect_equal(redis$llen(key), 1)
expect_equal(redis$llen(altkey), 2)
expect_equal(redis$lpop(key), 3)    # as 1 and 2 have been moved (both from left)
expect_equal(redis$lpop(altkey), 2) # as 2 was inserted to the left
expect_equal(redis$lpop(altkey), 1) # as 1 remains
