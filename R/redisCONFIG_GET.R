#'@title Get the value of a configuration parameter
#'@export
redisCONFIG_GET <- function( parameter, Rc) {
	cmd <- sprintf("CONFIG GET %s", parameter)
	redisCommand(cmd, Rc)
}
