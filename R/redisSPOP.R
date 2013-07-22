#'@title Remove and return a random member from a set
#'@export
redisSPOP <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SPOP"
	redisCommand(Rc, cmd, list(key))
}
