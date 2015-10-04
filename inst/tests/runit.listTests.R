test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    redis <<- new(Redis)

    exampleNumericElement <<- 1.0
    exampleCharElement <<- "a"
    key <<- "RcppRedis:test:mylist"
    redis$exec(paste("del", key))
}

test_02_lpush <- function() {
    # add example elements to the list
    n1 <- redis$lpush(key, exampleNumericElement)
    n2 <- redis$lpush(key, exampleCharElement)
    checkEquals(n1, 1)
    checkEquals(n2, 2)
}

test_03_lpop <- function() {
    # remove example elements from the list
    res1 <- redis$lpop(key)
    res2 <- redis$lpop(key)
    checkEquals(res1, exampleCharElement)
    checkEquals(res2, exampleNumericElement)
}

test_04_lpopnull <- function() {
    # try to lpop beyond list extent
    res <- redis$rpop(key)
    checkEquals(res, NULL)
}

test_05_rpush <- function() {
    # add example elements to the list
    n1 <- redis$rpush(key, exampleNumericElement)
    n2 <- redis$rpush(key, exampleCharElement)
    checkEquals(n1, 1)
    checkEquals(n2, 2)
}

test_06_rpop <- function() {
    # remove example elements from the list
    res1 <- redis$rpop(key)
    res2 <- redis$rpop(key)
    checkEquals(res1, exampleCharElement)
    checkEquals(res2, exampleNumericElement)
}

test_07_rpopnull <- function() {
    # try to rpop beyond list extent
    res <- redis$rpop(key)
    checkEquals(res, NULL)
}

test_08_cleanup <- function() {
    ## delete key
    n <- redis$exec(paste("del", key))
    checkEquals(n, 0)
}
