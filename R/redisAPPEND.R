#'@title Append a value to a key
#'@export
redisAPPEND <- function( key,  value, Rc) {
	cmd <- "APPEND"
	redisCommand(Rc, cmd, list(key, value))
}
