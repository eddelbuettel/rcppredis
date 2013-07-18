#'@title Append one or multiple values to a list
#'@export
redisRPUSH <- function( key,  value, Rc) {
	cmd <- sprintf("RPUSH %s %s", key, value)
	redisCommand(cmd, Rc)
}
