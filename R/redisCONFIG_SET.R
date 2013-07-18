#'@title Set a configuration parameter to the given value
#'@export
redisCONFIG_SET <- function( parameter,  value, Rc) {
	cmd <- sprintf("CONFIG SET %s %s", parameter, value)
	redisCommand(cmd, Rc)
}
