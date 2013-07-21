#'@title Return a range of members in a sorted set, by index
#'@export
redisZRANGE <- function( key,  start,  stop, Rc) {
	cmd <- "ZRANGE"
	redisCommand(Rc, cmd, list(key, start, stop))
}
