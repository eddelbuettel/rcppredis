#'@title Return a serialized version of the value stored at the specified key.
#'@export
redisDUMP <- function( key, Rc) {
	cmd <- "DUMP"
	redisCommand(Rc, cmd, list(key))
}
