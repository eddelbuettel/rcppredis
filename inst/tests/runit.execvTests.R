test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    redis <<- new(Redis)

    key <<- "RcppRedis:test:foo bar"
    val <<- "qux baz"
}

test_02_execv <- function() {
    ## set and get
    redis$execv(c("SET", key, val))
    res <- redis$execv(c("GET", key))
    checkEquals(res, val)
}

test_03_cleanup <- function() {
    ## delete set
    n <- redis$execv(c("del", key))
    checkEquals(n, 1)
}
