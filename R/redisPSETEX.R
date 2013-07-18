#'@title Set the value and expiration in milliseconds of a key
#'@export
redisPSETEX <- function( key,  milliseconds,  value, Rc) {
	cmd <- sprintf("PSETEX %s %s %s", key, milliseconds, value)
	redisCommand(cmd, Rc)
}
