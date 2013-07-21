#'@title Sets or clears the bit at offset in the string value stored at key
#'@export
redisSETBIT <- function( key,  offset,  value, Rc) {
	cmd <- "SETBIT"
	redisCommand(Rc, cmd, list(key, offset, value))
}
