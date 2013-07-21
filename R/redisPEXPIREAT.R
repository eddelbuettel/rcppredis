#'@title Set the expiration for a key as a UNIX timestamp specified in milliseconds
#'@export
redisPEXPIREAT <- function( key,  milliseconds, Rc) {
	cmd <- "PEXPIREAT"
	redisCommand(Rc, cmd, list(key, milliseconds))
}
