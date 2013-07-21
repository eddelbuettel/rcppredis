#'@title Set the string value of a key
#'@export
redisSET <- function( key,  value, Rc) {
	cmd <- "SET"
	redisCommand(Rc, cmd, list(key, value))
}
