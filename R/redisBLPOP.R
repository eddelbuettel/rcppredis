#'@title Remove and get the first element in a list, or block until one is available
#'@export
redisBLPOP <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BLPOP"
	redisCommand(Rc, cmd, list(key))
}
