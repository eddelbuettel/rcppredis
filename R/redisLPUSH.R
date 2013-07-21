#'@title Prepend one or multiple values to a list
#'@export
redisLPUSH <- function( key,  value, Rc) {
	cmd <- "LPUSH"
	redisCommand(Rc, cmd, list(key, value))
}
