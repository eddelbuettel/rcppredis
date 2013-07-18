#'@title Increment the score of a member in a sorted set
#'@export
redisZINCRBY <- function( key,  increment,  member, Rc) {
	cmd <- sprintf("ZINCRBY %s %s %s", key, increment, member)
	redisCommand(cmd, Rc)
}
