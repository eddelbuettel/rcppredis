#'@title Increment the float value of a key by the given amount
#'@export
redisINCRBYFLOAT <- function( key,  increment, Rc) {
	cmd <- sprintf("INCRBYFLOAT %s %s", key, increment)
	redisCommand(cmd, Rc)
}
