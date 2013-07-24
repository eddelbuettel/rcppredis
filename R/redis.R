## minimal R interface to redis using the hiredis library
redis <- function(cmd) {
    ## some sanity checking on cmd would be nice too...
    .Call("execRedisCommand", cmd, package="Rhiredis")
}

loadModule("Redis", TRUE)               # ensure module gets loaded
