#'@title Remove all members in a sorted set within the given scores
#'@export
redisZREMRANGEBYSCORE <- function( key,  min,  max, Rc) {
	cmd <- sprintf("ZREMRANGEBYSCORE %s %s %s", key, min, max)
	redisCommand(cmd, Rc)
}
