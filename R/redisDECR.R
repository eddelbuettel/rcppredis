#'@title Decrement the integer value of a key by one
#'@export
redisDECR <- function( key, Rc) {
	cmd <- sprintf("DECR %s", key)
	redisCommand(cmd, Rc)
}
