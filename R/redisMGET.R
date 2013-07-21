#'@title Get the values of all the given keys
#'@export
redisMGET <- function( key, Rc) {
	cmd <- "MGET"
	redisCommand(Rc, cmd, list(key))
}
