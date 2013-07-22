#'@title Increment the integer value of a hash field by the given number
#'@export
redisHINCRBY <- function( key,  field,  increment, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HINCRBY"
	redisCommand(Rc, cmd, list(key, field, increment))
}
