#'@title Append one or multiple values to a list
#'@export
redisRPUSH <- function( key,  value, Rc) {
	cmd <- "RPUSH"
	redisCommand(Rc, cmd, list(key, value))
}
