#'@title Count the members in a sorted set with scores within the given values
#'@export
redisZCOUNT <- function( key,  min,  max, Rc) {
	cmd <- sprintf("ZCOUNT %s %s %s", key, min, max)
	redisCommand(cmd, Rc)
}
