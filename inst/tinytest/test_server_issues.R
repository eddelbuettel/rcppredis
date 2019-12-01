
exit_file("Skip this test")

#test_01_setup <- function() {
suppressMessages(library(RcppRedis))
## we start the Redis server for this test as a slave so we don't clobber the main running version of redis for the rest of the tests
tmpfile <- tempfile()
writeLines("requirepass badPassword", tmpfile)
system(paste("redis-server", tmpfile, "--port 7777 --slaveof localhost 6379"), wait=FALSE)
## Wait for server to come up
Sys.sleep(5)


#test_02_testUnauth <- function () {
redis <- new(RcppRedis::Redis, "localhost", 7777, auth = "", 10)
## we expect an exception because we haven't send the password
expect_error(redis$ping())


#test_03_testAuth <- function () {
redis <- new(RcppRedis::Redis, "localhost", 7777, auth = "badPassword", 10)
expect_equal(redis$ping(), "PONG")


#test_04_killServer <- function() {
## confirm server is up
expect_equal(redis$ping(),"PONG")
## kill server
expect_error(redis$exec("SHUTDOWN"))


#test_05_cleanup <- function() {
#NULL
