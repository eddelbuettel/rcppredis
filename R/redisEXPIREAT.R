#'@title Set the expiration for a key as a UNIX timestamp
#'@export
redisEXPIREAT <- function( key,  timestamp, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "EXPIREAT"
	redisCommand(Rc, cmd, list(key, timestamp))
}
