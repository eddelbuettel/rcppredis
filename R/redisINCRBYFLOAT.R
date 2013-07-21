#'@title Increment the float value of a key by the given amount
#'@export
redisINCRBYFLOAT <- function( key,  increment, Rc) {
	cmd <- "INCRBYFLOAT"
	redisCommand(Rc, cmd, list(key, increment))
}
