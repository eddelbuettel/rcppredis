
## maybe call toChar() and fromChar instead ?

serializeToChar <- function(obj) {
    .Call("serializeToChar", obj, PACKAGE="rhiredis")
}

serializeToRaw <- function(obj) {
    .Call("serializeToRaw", obj, PACKAGE="rhiredis")
}

unserializeFromChar <- function(obj) {
    .Call("unserializeFromChar", obj, PACKAGE="rhiredis")
}

unserializeFromRaw <- function(obj) {
    .Call("unserializeFromRaw", obj, PACKAGE="rhiredis")
}

## example using rredis (when function was still called serialize() and produced raw types
##
## R> val <- rhiredis::serialize(1:4)
## R> val
##  [1] 42 0a 02 00 00 00 02 00 03 00 00 03 02 00 0d 00 00 00 04 00 00 00 01 00 00 00
## [27] 02 00 00 00 03 00 00 00 04 00 00 00
## R> rredis::redisRPush("somequeue", val)
## [1] 1
## R> rredis::redisLPop("somequeue")
## [1] 1 2 3 4
## R>
##
##




## set and retrieve a number
# redis <- new(Redis, "127.0.0.1", 6379)
# redis$exec(paste("SET serialTest ", rawToChar(val)))
# rhiredis::unserialize(charToRaw(redis$exec("GET serialTest")))

## now with charToRaw / rawToChar built in
.simpleDemo <- function() {
    val <- rhiredis::serializeToChar(1:4)
    redis <- new(Redis, "127.0.0.1", 6379)
    redis$exec(paste("SET serialTest ", val))
    rhiredis::unserializeFromChar(redis$exec("GET serialTest"))
    NULL
}




