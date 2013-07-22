#'@title Append a value to a key
#'@export
redisAPPEND <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "APPEND"
	redisCommand(Rc, cmd, list(key, value))
}
