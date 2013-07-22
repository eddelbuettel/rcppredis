#'@title Rename a key
#'@export
redisRENAME <- function( key,  newkey, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RENAME"
	redisCommand(Rc, cmd, list(key, newkey))
}
