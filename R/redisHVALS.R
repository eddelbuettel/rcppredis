#'@title Get all the values in a hash
#'@export
redisHVALS <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HVALS"
	redisCommand(Rc, cmd, list(key))
}
