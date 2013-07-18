#'@title Perform bitwise operations between strings
#'@export
redisBITOP <- function( operation,  destkey,  key, Rc) {
	cmd <- sprintf("BITOP %s %s %s", operation, destkey, key)
	redisCommand(cmd, Rc)
}
