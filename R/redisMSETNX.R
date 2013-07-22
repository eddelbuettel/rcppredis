#'@title Set multiple keys to multiple values, only if none of the keys exist
#'@export
redisMSETNX <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MSETNX"
	redisCommand(Rc, cmd, list(key, value))
}
