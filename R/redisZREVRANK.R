#'@title Determine the index of a member in a sorted set, with scores ordered from high to low
#'@export
redisZREVRANK <- function( key,  member, Rc) {
	cmd <- sprintf("ZREVRANK %s %s", key, member)
	redisCommand(cmd, Rc)
}
