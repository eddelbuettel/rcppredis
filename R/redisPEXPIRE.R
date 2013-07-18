#'@title Set a key's time to live in milliseconds
#'@export
redisPEXPIRE <- function( key,  milliseconds, Rc) {
	cmd <- sprintf("PEXPIRE %s %s", key, milliseconds)
	redisCommand(cmd, Rc)
}
