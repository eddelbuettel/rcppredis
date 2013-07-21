#'@title Return a range of members in a sorted set, by index, with scores ordered from high to low
#'@export
redisZREVRANGE <- function( key,  start,  stop, Rc) {
	cmd <- "ZREVRANGE"
	redisCommand(Rc, cmd, list(key, start, stop))
}
