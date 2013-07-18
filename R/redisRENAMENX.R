#'@title Rename a key, only if the new key does not exist
#'@export
redisRENAMENX <- function( key,  newkey, Rc) {
	cmd <- sprintf("RENAMENX %s %s", key, newkey)
	redisCommand(cmd, Rc)
}
