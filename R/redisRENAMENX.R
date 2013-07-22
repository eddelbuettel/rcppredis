#'@title Rename a key, only if the new key does not exist
#'@export
redisRENAMENX <- function( key,  newkey, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RENAMENX"
	redisCommand(Rc, cmd, list(key, newkey))
}
