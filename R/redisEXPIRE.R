#'@title Set a key's time to live in seconds
#'@export
redisEXPIRE <- function( key,  seconds, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "EXPIRE"
	redisCommand(Rc, cmd, list(key, seconds))
}
