#'@title Increment the score of a member in a sorted set
#'@export
redisZINCRBY <- function( key,  increment,  member, Rc) {
	cmd <- "ZINCRBY"
	redisCommand(Rc, cmd, list(key, increment, member))
}
