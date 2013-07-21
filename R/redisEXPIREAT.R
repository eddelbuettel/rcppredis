#'@title Set the expiration for a key as a UNIX timestamp
#'@export
redisEXPIREAT <- function( key,  timestamp, Rc) {
	cmd <- "EXPIREAT"
	redisCommand(Rc, cmd, list(key, timestamp))
}
