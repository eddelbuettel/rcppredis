#'@title Increment the integer value of a key by one
#'@export
redisINCR <- function( key, Rc) {
	cmd <- "INCR"
	redisCommand(Rc, cmd, list(key))
}
