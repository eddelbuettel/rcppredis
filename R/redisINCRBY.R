#'@title Increment the integer value of a key by the given amount
#'@export
redisINCRBY <- function( key,  increment, Rc) {
	cmd <- sprintf("INCRBY %s %s", key, increment)
	redisCommand(cmd, Rc)
}
