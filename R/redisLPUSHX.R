#'@title Prepend a value to a list, only if the list exists
#'@export
redisLPUSHX <- function( key,  value, Rc) {
	cmd <- sprintf("LPUSHX %s %s", key, value)
	redisCommand(cmd, Rc)
}
