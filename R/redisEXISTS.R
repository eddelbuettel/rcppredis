#'@title Determine if a key exists
#'@export
redisEXISTS <- function( key, Rc) {
	cmd <- "EXISTS"
	redisCommand(Rc, cmd, list(key))
}
