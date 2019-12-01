#test_01_setup <- function() {
suppressMessages(library(RcppRedis))
redis <- new(Redis)

key <- "RcppRedis:test:foo bar"
val <- "qux baz"


#test_02_execv <- function() {
## set and get
redis$execv(c("SET", key, val))
res <- redis$execv(c("GET", key))
expect_equal(res, val)


#test_03_execvError <- function() {
expect_error(redis$execv(c("LRANGE mylist 0 elephant")))


#test_04_cleanup <- function() {
## delete set
n <- redis$execv(c("del", key))
expect_equal(n, 1)
