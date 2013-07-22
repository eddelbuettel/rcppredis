#'@title Remove and get the last element in a list
#'@export
redisRPOP <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RPOP"
	redisCommand(Rc, cmd, list(key))
}
