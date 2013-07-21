#'@title Set the value and expiration in milliseconds of a key
#'@export
redisPSETEX <- function( key,  milliseconds,  value, Rc) {
	cmd <- "PSETEX"
	redisCommand(Rc, cmd, list(key, milliseconds, value))
}
