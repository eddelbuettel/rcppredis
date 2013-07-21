#'@title Remove all members in a sorted set within the given indexes
#'@export
redisZREMRANGEBYRANK <- function( key,  start,  stop, Rc) {
	cmd <- "ZREMRANGEBYRANK"
	redisCommand(Rc, cmd, list(key, start, stop))
}
