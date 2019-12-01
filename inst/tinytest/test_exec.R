#test_01_setup <- function() {
suppressMessages(library(RcppRedis))
redis <- new(Redis)

key <- "RcppRedis:exec:test:foo"
val <- "qux"
#}

#test_02_exec <- function() {
## set and get
redis$exec(paste("SET", key, val))
res <- redis$exec(paste("GET", key))
expect_equal(res, val)


#test_03_execError <- function() {
expect_error(redis$exec("LRANGE mylist 0 elephant"))


#test_04_cleanup <- function() {
## delete set
n <- redis$exec(paste("del", key))
expect_equal(n, 1)
