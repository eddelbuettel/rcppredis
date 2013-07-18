#'@title Determine the index of a member in a sorted set
#'@export
redisZRANK <- function( key,  member, Rc) {
	cmd <- sprintf("ZRANK %s %s", key, member)
	redisCommand(cmd, Rc)
}
