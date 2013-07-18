#'@title Get the number of members in a sorted set
#'@export
redisZCARD <- function( key, Rc) {
	cmd <- sprintf("ZCARD %s", key)
	redisCommand(cmd, Rc)
}
