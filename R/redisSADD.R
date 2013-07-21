#'@title Add one or more members to a set
#'@export
redisSADD <- function( key,  member, Rc) {
	cmd <- "SADD"
	redisCommand(Rc, cmd, list(key, member))
}
