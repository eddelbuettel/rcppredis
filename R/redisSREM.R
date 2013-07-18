#'@title Remove one or more members from a set
#'@export
redisSREM <- function( key,  member, Rc) {
	cmd <- sprintf("SREM %s %s", key, member)
	redisCommand(cmd, Rc)
}
