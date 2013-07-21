#'@title Get an element from a list by its index
#'@export
redisLINDEX <- function( key,  index, Rc) {
	cmd <- "LINDEX"
	redisCommand(Rc, cmd, list(key, index))
}
