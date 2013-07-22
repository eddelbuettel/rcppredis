#'@title Remove and get the first element in a list
#'@export
redisLPOP <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LPOP"
	redisCommand(Rc, cmd, list(key))
}
