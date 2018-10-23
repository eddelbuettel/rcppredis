test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    redis <<- new(Redis)

    hashname <<- "myhash"
    
    xname <<- "hat"
    xdata <<- rnorm(10)

    yname <<- "cat"
    ydata <<- rnorm(10)

    ##list.hashname <<- "mylisthash"
    ##list.data <<- list(green=rnorm(10),eggs=rnorm(3),ham=rnorm(30))
}

test_02_hset <- function() {
    ## create a hash
    n <- redis$hset(hashname, xname, xdata)
    checkEquals(n, 1)
}

test_03_hset_2 <- function() {
    ## add an already-present element to a hash
    n <- redis$hset(hashname, xname, xdata)
    checkEquals(n, 0)
}

test_04_hget <- function() {
    ## pull back the set element
    hashdata <- redis$hget(hashname, xname)
    checkIdentical(xdata, hashdata)
}

test_05_setup <- function() {
    ## add more ele to hash
    n <- redis$hset(hashname, yname, ydata)
    checkEquals(n, 1)
}

test_06_hlen <- function() {
    ## check 
    n <- redis$hlen(hashname)
    checkEquals(n, 2)
}

test_07_hkeys <- function() {
    ## check 
    res <- redis$hkeys(hashname)
    checkEquals(res, c(xname,yname))
}

test_08_hgetall <- function() {
    ## check 
    res <- redis$hgetall(hashname)
    checkEquals(res,  structure(list(xdata,ydata),names=c(xname,yname)))
}

test_09_hdel <- function() {
    ## check 
    n <- redis$hdel(hashname,yname)
    checkEquals(n, 1)
}

test_09_hdel_1 <- function() {
    ## check already deleted
    n <- redis$hdel(hashname,yname)
    checkEquals(n, 0)
}

test_09_hdel_2 <- function() {
    ## check
    n <- redis$hdel(hashname,xname)
    checkEquals(n, 1)
}

test_09_hdel_3 <- function() {
    ## check hash should now be removed
    n <- redis$hexists(hashname, xname)
    checkEquals(n, 0)
}
