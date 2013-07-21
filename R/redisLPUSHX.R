#'@title Prepend a value to a list, only if the list exists
#'@export
redisLPUSHX <- function( key,  value, Rc) {
	cmd <- "LPUSHX"
	redisCommand(Rc, cmd, list(key, value))
}
