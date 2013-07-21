#'@title Set the value of a key, only if the key does not exist
#'@export
redisSETNX <- function( key,  value, Rc) {
	cmd <- "SETNX"
	redisCommand(Rc, cmd, list(key, value))
}
