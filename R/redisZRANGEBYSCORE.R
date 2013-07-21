#'@title Return a range of members in a sorted set, by score
#'@export
redisZRANGEBYSCORE <- function( key,  min,  max, Rc) {
	cmd <- "ZRANGEBYSCORE"
	redisCommand(Rc, cmd, list(key, min, max))
}
