#'@title Set a key's time to live in milliseconds
#'@export
redisPEXPIRE <- function( key,  milliseconds, Rc) {
	cmd <- "PEXPIRE"
	redisCommand(Rc, cmd, list(key, milliseconds))
}
