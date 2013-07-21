#'@title Determine the index of a member in a sorted set
#'@export
redisZRANK <- function( key,  member, Rc) {
	cmd <- "ZRANK"
	redisCommand(Rc, cmd, list(key, member))
}
