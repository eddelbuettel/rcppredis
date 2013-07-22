#'@title Remove and get the last element in a list, or block until one is available
#'@export
redisBRPOP <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BRPOP"
	redisCommand(Rc, cmd, list(key))
}
