#'@title Remove all members in a sorted set within the given indexes
#'@export
redisZREMRANGEBYRANK <- function( key,  start,  stop, Rc) {
	cmd <- sprintf("ZREMRANGEBYRANK %s %s %s", key, start, stop)
	redisCommand(cmd, Rc)
}
