#'@title Set the value and expiration of a key
#'@export
redisSETEX <- function( key,  seconds,  value, Rc) {
	cmd <- sprintf("SETEX %s %s %s", key, seconds, value)
	redisCommand(cmd, Rc)
}
