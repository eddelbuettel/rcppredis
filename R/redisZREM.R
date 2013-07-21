#'@title Remove one or more members from a sorted set
#'@export
redisZREM <- function( key,  member, Rc) {
	cmd <- "ZREM"
	redisCommand(Rc, cmd, list(key, member))
}
