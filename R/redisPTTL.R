#'@title Get the time to live for a key in milliseconds
#'@export
redisPTTL <- function( key, Rc) {
	cmd <- sprintf("PTTL %s", key)
	redisCommand(cmd, Rc)
}
