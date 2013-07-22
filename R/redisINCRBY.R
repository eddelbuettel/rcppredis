#'@title Increment the integer value of a key by the given amount
#'@export
redisINCRBY <- function( key,  increment, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "INCRBY"
	redisCommand(Rc, cmd, list(key, increment))
}
