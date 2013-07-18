#'@title Add one or more members to a set
#'@export
redisSADD <- function( key,  member, Rc) {
	cmd <- sprintf("SADD %s %s", key, member)
	redisCommand(cmd, Rc)
}
