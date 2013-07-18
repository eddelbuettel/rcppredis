#'@title Get an element from a list by its index
#'@export
redisLINDEX <- function( key,  index, Rc) {
	cmd <- sprintf("LINDEX %s %s", key, index)
	redisCommand(cmd, Rc)
}
