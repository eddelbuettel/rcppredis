#'@title Delete one or more hash fields
#'@export
redisHDEL <- function( key,  field, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HDEL"
	redisCommand(Rc, cmd, list(key, field))
}
