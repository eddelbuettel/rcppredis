#'@title Set the value and expiration in milliseconds of a key
#'@export
redisPSETEX <- function( key,  milliseconds,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PSETEX"
	redisCommand(Rc, cmd, list(key, milliseconds, value))
}
