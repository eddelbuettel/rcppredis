#'@title Remove one or more members from a sorted set
#'@export
redisZREM <- function( key,  member, Rc) {
	cmd <- sprintf("ZREM %s %s", key, member)
	redisCommand(cmd, Rc)
}
