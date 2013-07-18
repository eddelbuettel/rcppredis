#'@title Set the string value of a key
#'@export
redisSET <- function( key,  value, Rc) {
	cmd <- sprintf("SET %s %s", key, value)
	redisCommand(cmd, Rc)
}
