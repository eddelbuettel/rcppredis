#test_01_setup <- function() {
suppressMessages(library(RcppRedis))
redis <- new(Redis)

hashname <- "myhash"

xname <- "hat"
xdata <- rnorm(10)

yname <- "cat"
ydata <- rnorm(10)


#test_02_hset <- function() {
## create a hash
n <- redis$hset(hashname, xname, xdata)
expect_equal(n, 1)


#test_03_hset_2 <- function() {
## add an already-present element to a hash
n <- redis$hset(hashname, xname, xdata)
expect_equal(n, 0)


#test_04_hget <- function() {
## pull back the set element
hashdata <- redis$hget(hashname, xname)
expect_identical(xdata, hashdata)


#test_05_setup <- function() {
## add more ele to hash
n <- redis$hset(hashname, yname, ydata)
expect_equal(n, 1)


#test_06_hlen <- function() {
## check for two keys
n <- redis$hlen(hashname)
expect_equal(n, 2)


#test_07_hkeys <- function() {
## check for values hash keys: sort order not given
res <- redis$hkeys(hashname)
expect_equal(sort(res), sort(c(xname,yname)))


#test_08_hgetall <- function() {
## check for all data
res <- redis$hgetall(hashname)
expect_equal(sort(names(res)), sort(c(xname,yname)))
expect_equal(res[[xname]], xdata)
expect_equal(res[[yname]], ydata)


#test_09_hdel <- function() {
## check
n <- redis$hdel(hashname,yname)
expect_equal(n, 1)


#test_09_hdel_1 <- function() {
## check already deleted
n <- redis$hdel(hashname,yname)
expect_equal(n, 0)


#test_09_hdel_2 <- function() {
## check
n <- redis$hdel(hashname,xname)
expect_equal(n, 1)


#test_09_hdel_3 <- function() {
## check hash should now be removed
n <- redis$hexists(hashname, xname)
expect_equal(n, 0)
