#'@title Watch the given keys to determine execution of the MULTI/EXEC block
#'@export
redisWATCH <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "WATCH"
	redisCommand(Rc, cmd, list(key))
}
