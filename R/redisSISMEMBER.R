#'@title Determine if a given value is a member of a set
#'@export
redisSISMEMBER <- function( key,  member, Rc) {
	cmd <- sprintf("SISMEMBER %s %s", key, member)
	redisCommand(cmd, Rc)
}
