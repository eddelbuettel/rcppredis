
## maybe call toChar() and fromChar instead ?

serialize <- function(obj) {
    .Call("serializeToChar", obj, PACKAGE="rhiredis")
}

unserialize <- function(obj) {
    .Call("unserializeFromChar", obj, PACKAGE="rhiredis")
}

## example using rredis
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

## R> val <- rhiredis::serialize(1:4)
## R> val
##  [1] 41 0a 32 0a 31 39 36 36 31 30 0a 31 33 31 38 34 30 0a 31 33 0a 34 0a 31 0a 32
## [27] 0a 33 0a 34 0a
## R>


## set and retrieve a number
# redis <- new(Redis, "127.0.0.1", 6379)
# redis$exec(paste("SET serialTest ", rawToChar(val)))
# rhiredis::unserialize(charToRaw(redis$exec("GET serialTest")))

## now with charToRaw / rawToChar built in
.simpleDemo <- function() {
    val <- rhiredis::serialize(1:4)
    redis <- new(Redis, "127.0.0.1", 6379)
    redis$exec(paste("SET serialTest ", val))
    rhiredis::unserialize(redis$exec("GET serialTest"))
    NULL
}
