#'@title Return a range of members in a sorted set, by score
#'@export
redisZRANGEBYSCORE <- function( key,  min,  max, Rc) {
	cmd <- sprintf("ZRANGEBYSCORE %s %s %s", key, min, max)
	redisCommand(cmd, Rc)
}
