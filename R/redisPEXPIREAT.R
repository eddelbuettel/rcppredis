#'@title Set the expiration for a key as a UNIX timestamp specified in milliseconds
#'@export
redisPEXPIREAT <- function( key,  milliseconds, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PEXPIREAT"
	redisCommand(Rc, cmd, list(key, milliseconds))
}
