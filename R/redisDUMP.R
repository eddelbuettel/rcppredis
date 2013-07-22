#'@title Return a serialized version of the value stored at the specified key.
#'@export
redisDUMP <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DUMP"
	redisCommand(Rc, cmd, list(key))
}
