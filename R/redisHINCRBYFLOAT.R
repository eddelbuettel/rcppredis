#'@title Increment the float value of a hash field by the given amount
#'@export
redisHINCRBYFLOAT <- function( key,  field,  increment, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HINCRBYFLOAT"
	redisCommand(Rc, cmd, list(key, field, increment))
}
