#'@title Delete a key
#'@export
redisDEL <- function( key, Rc) {
	cmd <- sprintf("DEL %s", key)
	redisCommand(cmd, Rc)
}
