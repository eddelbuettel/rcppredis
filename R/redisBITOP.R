#'@title Perform bitwise operations between strings
#'@export
redisBITOP <- function( operation,  destkey,  key, Rc) {
	cmd <- "BITOP"
	redisCommand(Rc, cmd, list(operation, destkey, key))
}
