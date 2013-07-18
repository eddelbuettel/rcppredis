#'@title Set the expiration for a key as a UNIX timestamp
#'@export
redisEXPIREAT <- function( key,  timestamp, Rc) {
	cmd <- sprintf("EXPIREAT %s %s", key, timestamp)
	redisCommand(cmd, Rc)
}
