#'@title Get the value of a key
#'@export
redisGET <- function( key, Rc) {
	cmd <- "GET"
	redisCommand(Rc, cmd, list(key))
}
