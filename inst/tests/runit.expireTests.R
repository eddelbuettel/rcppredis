test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    redis <<- new(Redis)
    key <<- "RcppRedis:test:myexpires"
}

test_02_keyexpiresAfter1s <- function() {
    redis$set(key, 10)
    redis$expire(key, 1)
    Sys.sleep(1.5)
    n <- redis$exists(key)
    checkEquals(n, 0)
}

test_02_keyexpiresAfter2s <- function() {
    redis$set(key, 10)
    redis$expire(key, 2)
    Sys.sleep(1)
    n <- redis$exists(key)
    checkEquals(n, 1)
    Sys.sleep(1.5)    
    n <- redis$exists(key)
    checkEquals(n, 0)
}

test_02_keyexpiresAfter1500ms <- function() {
    redis$set(key, 10)
    redis$expire(key, .9)
    Sys.sleep(.3)
    n <- redis$exists(key)
    checkEquals(n, 1)
    Sys.sleep(1.6)    
    n <- redis$exists(key)
    checkEquals(n, 0)
}

test_03_cleanup <- function() {
    ## delete key
    redis$exec(paste("del", key))
    checkEquals(redis$exists(key), 0)
}
