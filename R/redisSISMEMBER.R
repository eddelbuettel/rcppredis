#'@title Determine if a given value is a member of a set
#'@export
redisSISMEMBER <- function( key,  member, Rc) {
	cmd <- "SISMEMBER"
	redisCommand(Rc, cmd, list(key, member))
}
