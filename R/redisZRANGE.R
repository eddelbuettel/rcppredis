#'@title Return a range of members in a sorted set, by index
#'@export
redisZRANGE <- function( key,  start,  stop, Rc) {
	cmd <- sprintf("ZRANGE %s %s %s", key, start, stop)
	redisCommand(cmd, Rc)
}
