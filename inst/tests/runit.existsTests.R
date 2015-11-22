test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    redis <<- new(Redis)
    key <<- "RcppRedis:test:myexists"
}

test_02_exists <- function() {
    redis$set(key, 10)
    n <- redis$exists(key)
    checkEquals(n, 1)
}

test_02_doesNotExist <- function() {
    n <- redis$exists("thisKeyIsNotSet-test")
    checkEquals(n, 0)
}

test_03_cleanup <- function() {
    ## delete key
    n <- redis$exec(paste("del", key))
    checkEquals(n, 1)
}
