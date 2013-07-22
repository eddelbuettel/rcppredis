#'@title Append a value to a list, only if the list exists
#'@export
redisRPUSHX <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RPUSHX"
	redisCommand(Rc, cmd, list(key, value))
}
