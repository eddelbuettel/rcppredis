#'@title Get the score associated with the given member in a sorted set
#'@export
redisZSCORE <- function( key,  member, Rc) {
	cmd <- "ZSCORE"
	redisCommand(Rc, cmd, list(key, member))
}
