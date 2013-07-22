#'@title Prepend one or multiple values to a list
#'@export
redisLPUSH <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LPUSH"
	redisCommand(Rc, cmd, list(key, value))
}
