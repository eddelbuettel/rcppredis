#'@title Get the time to live for a key
#'@export
redisTTL <- function( key, Rc) {
	cmd <- "TTL"
	redisCommand(Rc, cmd, list(key))
}
