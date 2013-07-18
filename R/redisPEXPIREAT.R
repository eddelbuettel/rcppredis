#'@title Set the expiration for a key as a UNIX timestamp specified in milliseconds
#'@export
redisPEXPIREAT <- function( key,  milliseconds, Rc) {
	cmd <- sprintf("PEXPIREAT %s %s", key, milliseconds)
	redisCommand(cmd, Rc)
}
