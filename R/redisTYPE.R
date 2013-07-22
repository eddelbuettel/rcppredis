#'@title Determine the type stored at key
#'@export
redisTYPE <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "TYPE"
	redisCommand(Rc, cmd, list(key))
}
