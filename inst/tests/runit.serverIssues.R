test_01_setup <- function() {
    suppressMessages(library(RcppRedis))
    # we start the Redis server for this test as a slave so we don't clobber the main running version of redis for the rest of the tests
    writeLines("requirepass badPassword","/tmp/redis.conf")
    system("redis-server /tmp/redis.conf --port 7777 --slaveof localhost 6379", wait=FALSE)
    # Wait for server to come up
    Sys.sleep(5)
}

test_02_testUnauth <- function () {
  redis <<- new(RcppRedis::Redis, "localhost", 7777, auth = "", 10)
  # we expect an exception because we haven't send the password
  checkException(redis$ping())
}

test_03_testAuth <- function () {
  redis <<- new(RcppRedis::Redis, "localhost", 7777, auth = "badPassword", 10)
  checkEquals(redis$ping(), "PONG")
}

test_04_killServer <- function() {
    # confirm server is up
    checkEquals(redis$ping(),"PONG")
    # kill server
    checkException(redis$exec("SHUTDOWN"))
}

test_05_cleanup <- function() {
    NULL
}
