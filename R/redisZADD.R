#'@title Add one or more members to a sorted set, or update its score if it already exists
#'@export
redisZADD <- function( key,  score,  member, Rc) {
	cmd <- "ZADD"
	redisCommand(Rc, cmd, list(key, score, member))
}
