#'@title Add one or more members to a sorted set, or update its score if it already exists
#'@export
redisZADD <- function( key,  score,  member, Rc) {
	cmd <- sprintf("ZADD %s %s %s", key, score, member)
	redisCommand(cmd, Rc)
}
