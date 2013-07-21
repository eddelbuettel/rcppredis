#'@title Count the members in a sorted set with scores within the given values
#'@export
redisZCOUNT <- function( key,  min,  max, Rc) {
	cmd <- "ZCOUNT"
	redisCommand(Rc, cmd, list(key, min, max))
}
