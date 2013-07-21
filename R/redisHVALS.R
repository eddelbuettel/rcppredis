#'@title Get all the values in a hash
#'@export
redisHVALS <- function( key, Rc) {
	cmd <- "HVALS"
	redisCommand(Rc, cmd, list(key))
}
