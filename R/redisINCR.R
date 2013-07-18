#'@title Increment the integer value of a key by one
#'@export
redisINCR <- function( key, Rc) {
	cmd <- sprintf("INCR %s", key)
	redisCommand(cmd, Rc)
}
