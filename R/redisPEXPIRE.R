#'@title Set a key's time to live in milliseconds
#'@export
redisPEXPIRE <- function( key,  milliseconds, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PEXPIRE"
	redisCommand(Rc, cmd, list(key, milliseconds))
}
