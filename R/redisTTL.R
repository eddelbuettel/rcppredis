#'@title Get the time to live for a key
#'@export
redisTTL <- function( key, Rc) {
	cmd <- sprintf("TTL %s", key)
	redisCommand(cmd, Rc)
}
