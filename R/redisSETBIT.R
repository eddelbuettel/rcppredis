#'@title Sets or clears the bit at offset in the string value stored at key
#'@export
redisSETBIT <- function( key,  offset,  value, Rc) {
	cmd <- sprintf("SETBIT %s %s %s", key, offset, value)
	redisCommand(cmd, Rc)
}
