#'@title Decrement the integer value of a key by the given number
#'@export
redisDECRBY <- function( key,  decrement, Rc) {
	cmd <- sprintf("DECRBY %s %s", key, decrement)
	redisCommand(cmd, Rc)
}
