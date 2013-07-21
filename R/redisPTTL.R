#'@title Get the time to live for a key in milliseconds
#'@export
redisPTTL <- function( key, Rc) {
	cmd <- "PTTL"
	redisCommand(Rc, cmd, list(key))
}
