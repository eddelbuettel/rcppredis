#'@title Get the values of all the given keys
#'@export
redisMGET <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MGET"
	redisCommand(Rc, cmd, list(key))
}
