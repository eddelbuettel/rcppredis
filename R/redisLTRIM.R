#'@title Trim a list to the specified range
#'@export
redisLTRIM <- function( key,  start,  stop, Rc) {
	cmd <- sprintf("LTRIM %s %s %s", key, start, stop)
	redisCommand(cmd, Rc)
}
