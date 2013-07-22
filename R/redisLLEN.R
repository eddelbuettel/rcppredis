#'@title Get the length of a list
#'@export
redisLLEN <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LLEN"
	redisCommand(Rc, cmd, list(key))
}
