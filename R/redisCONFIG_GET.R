#'@title Get the value of a configuration parameter
#'@export
redisCONFIG_GET <- function( parameter, Rc) {
	cmd <- "CONFIG GET"
	redisCommand(Rc, cmd, list(parameter))
}
