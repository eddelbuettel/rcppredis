#'@title Set the value and expiration of a key
#'@export
redisSETEX <- function( key,  seconds,  value, Rc) {
	cmd <- "SETEX"
	redisCommand(Rc, cmd, list(key, seconds, value))
}
