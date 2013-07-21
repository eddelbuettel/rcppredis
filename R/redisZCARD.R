#'@title Get the number of members in a sorted set
#'@export
redisZCARD <- function( key, Rc) {
	cmd <- "ZCARD"
	redisCommand(Rc, cmd, list(key))
}
