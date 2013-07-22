#'@title Increment the score of a member in a sorted set
#'@export
redisZINCRBY <- function( key,  increment,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZINCRBY"
	redisCommand(Rc, cmd, list(key, increment, member))
}
