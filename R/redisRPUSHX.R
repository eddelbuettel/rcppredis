#'@title Append a value to a list, only if the list exists
#'@export
redisRPUSHX <- function( key,  value, Rc) {
	cmd <- "RPUSHX"
	redisCommand(Rc, cmd, list(key, value))
}
