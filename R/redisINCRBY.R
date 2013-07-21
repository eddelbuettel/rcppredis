#'@title Increment the integer value of a key by the given amount
#'@export
redisINCRBY <- function( key,  increment, Rc) {
	cmd <- "INCRBY"
	redisCommand(Rc, cmd, list(key, increment))
}
