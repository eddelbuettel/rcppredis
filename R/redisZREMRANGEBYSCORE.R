#'@title Remove all members in a sorted set within the given scores
#'@export
redisZREMRANGEBYSCORE <- function( key,  min,  max, Rc) {
	cmd <- "ZREMRANGEBYSCORE"
	redisCommand(Rc, cmd, list(key, min, max))
}
