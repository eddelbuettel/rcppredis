#'@title Set the value and expiration of a key
#'@export
redisSETEX <- function( key,  seconds,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SETEX"
	redisCommand(Rc, cmd, list(key, seconds, value))
}
