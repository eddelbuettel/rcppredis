#'@title Trim a list to the specified range
#'@export
redisLTRIM <- function( key,  start,  stop, Rc) {
	cmd <- "LTRIM"
	redisCommand(Rc, cmd, list(key, start, stop))
}
