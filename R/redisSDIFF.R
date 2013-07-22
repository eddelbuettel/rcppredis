#'@title Subtract multiple sets
#'@export
redisSDIFF <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SDIFF"
	redisCommand(Rc, cmd, list(key))
}
