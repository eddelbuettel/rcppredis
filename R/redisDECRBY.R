#'@title Decrement the integer value of a key by the given number
#'@export
redisDECRBY <- function( key,  decrement, Rc) {
	cmd <- "DECRBY"
	redisCommand(Rc, cmd, list(key, decrement))
}
