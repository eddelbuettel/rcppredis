#'@title Prepend a value to a list, only if the list exists
#'@export
redisLPUSHX <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LPUSHX"
	redisCommand(Rc, cmd, list(key, value))
}
