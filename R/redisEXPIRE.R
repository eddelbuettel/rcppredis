#'@title Set a key's time to live in seconds
#'@export
redisEXPIRE <- function( key,  seconds, Rc) {
	cmd <- sprintf("EXPIRE %s %s", key, seconds)
	redisCommand(cmd, Rc)
}
