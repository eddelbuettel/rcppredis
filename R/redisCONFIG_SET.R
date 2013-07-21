#'@title Set a configuration parameter to the given value
#'@export
redisCONFIG_SET <- function( parameter,  value, Rc) {
	cmd <- "CONFIG SET"
	redisCommand(Rc, cmd, list(parameter, value))
}
