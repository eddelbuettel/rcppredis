#'@title Get a range of elements from a list
#'@export
redisLRANGE <- function( key,  start,  stop, Rc) {
	cmd <- "LRANGE"
	redisCommand(Rc, cmd, list(key, start, stop))
}
