#'@title Get all the fields and values in a hash
#'@export
redisHGETALL <- function( key, Rc) {
	cmd <- "HGETALL"
	redisCommand(Rc, cmd, list(key))
}
