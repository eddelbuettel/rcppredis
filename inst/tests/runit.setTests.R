test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    redis <<- new(Redis)

    x <<- data.frame(x=letters[1:5], y=rnorm(5))
    y <<- list(foo=list(bar="qux"))
    key <<- "RcppRedis:test:myset"
}

test_02_sadd <- function() {
    ## add one element into a set
    n <- redis$sadd(key, x)
    checkEquals(n, 1)
}

test_03_sadd_2 <- function() {
    ## add an already-present element to a set
    n <- redis$sadd(key, x)
    checkEquals(n, 0)
}

test_04_smembers <- function() {
    ## pull back the set element
    mem <- redis$smembers(key)
    checkIdentical(x, mem[[1]])
}

test_05_sadd_3 <- function() {
    ## add a new element to a set
    n <- redis$sadd(key, y)
    checkEquals(n, 1)
}

test_06_smembers_2 <- function() {
    ## pull back the set elements
    ## order not guaranteed
    mem <- redis$smembers(key)
    checkTrue(identical(mem, list(x, y)) |
              identical(mem, list(y, x)))
}

test_07_srem <- function() {
    ## drop an element from set
    n <- redis$srem(key, x)
    checkEquals(n, 1)
}

test_08_smembers_3 <- function() {
    ## pull back the remaining element
    ## order not guaranteed
    mem <- redis$smembers(key)
    checkIdentical(y, mem[[1]])
}

test_09_cleanup <- function() {
    ## delete set
    n <- redis$exec(paste("del", key))
    checkEquals(n, 1)
}
