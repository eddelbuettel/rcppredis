#'@title Increment the integer value of a key by one
#'@export
redisINCR <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "INCR"
	redisCommand(Rc, cmd, list(key))
}
