#'@title Trim a list to the specified range
#'@export
redisLTRIM <- function( key,  start,  stop, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LTRIM"
	redisCommand(Rc, cmd, list(key, start, stop))
}
