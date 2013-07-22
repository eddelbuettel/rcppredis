#'@title Determine if a hash field exists
#'@export
redisHEXISTS <- function( key,  field, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HEXISTS"
	redisCommand(Rc, cmd, list(key, field))
}
