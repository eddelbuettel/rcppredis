#'@title Set a key's time to live in seconds
#'@export
redisEXPIRE <- function( key,  seconds, Rc) {
	cmd <- "EXPIRE"
	redisCommand(Rc, cmd, list(key, seconds))
}
