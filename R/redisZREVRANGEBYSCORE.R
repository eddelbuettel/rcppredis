#'@title Return a range of members in a sorted set, by score, with scores ordered from high to low
#'@export
redisZREVRANGEBYSCORE <- function( key,  max,  min, Rc) {
	cmd <- sprintf("ZREVRANGEBYSCORE %s %s %s", key, max, min)
	redisCommand(cmd, Rc)
}
