#'@title Get a range of elements from a list
#'@export
redisLRANGE <- function( key,  start,  stop, Rc) {
	cmd <- sprintf("LRANGE %s %s %s", key, start, stop)
	redisCommand(cmd, Rc)
}
