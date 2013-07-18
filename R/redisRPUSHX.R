#'@title Append a value to a list, only if the list exists
#'@export
redisRPUSHX <- function( key,  value, Rc) {
	cmd <- sprintf("RPUSHX %s %s", key, value)
	redisCommand(cmd, Rc)
}
