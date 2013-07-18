#'@title Return a serialized version of the value stored at the specified key.
#'@export
redisDUMP <- function( key, Rc) {
	cmd <- sprintf("DUMP %s", key)
	redisCommand(cmd, Rc)
}
