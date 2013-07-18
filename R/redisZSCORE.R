#'@title Get the score associated with the given member in a sorted set
#'@export
redisZSCORE <- function( key,  member, Rc) {
	cmd <- sprintf("ZSCORE %s %s", key, member)
	redisCommand(cmd, Rc)
}
