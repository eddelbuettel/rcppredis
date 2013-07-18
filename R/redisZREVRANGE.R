#'@title Return a range of members in a sorted set, by index, with scores ordered from high to low
#'@export
redisZREVRANGE <- function( key,  start,  stop, Rc) {
	cmd <- sprintf("ZREVRANGE %s %s %s", key, start, stop)
	redisCommand(cmd, Rc)
}
