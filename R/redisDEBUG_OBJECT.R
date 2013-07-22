#'@title Get debugging information about a key
#'@export
redisDEBUG_OBJECT <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DEBUG OBJECT"
	redisCommand(Rc, cmd, list(key))
}
