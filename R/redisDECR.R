#'@title Decrement the integer value of a key by one
#'@export
redisDECR <- function( key, Rc) {
	cmd <- "DECR"
	redisCommand(Rc, cmd, list(key))
}
