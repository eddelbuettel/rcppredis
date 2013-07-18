#'@title Prepend one or multiple values to a list
#'@export
redisLPUSH <- function( key,  value, Rc) {
	cmd <- sprintf("LPUSH %s %s", key, value)
	redisCommand(cmd, Rc)
}
