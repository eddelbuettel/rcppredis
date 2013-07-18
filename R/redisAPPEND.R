#'@title Append a value to a key
#'@export
redisAPPEND <- function( key,  value, Rc) {
	cmd <- sprintf("APPEND %s %s", key, value)
	redisCommand(cmd, Rc)
}
