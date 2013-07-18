#'@title Set the value of a key, only if the key does not exist
#'@export
redisSETNX <- function( key,  value, Rc) {
	cmd <- sprintf("SETNX %s %s", key, value)
	redisCommand(cmd, Rc)
}
