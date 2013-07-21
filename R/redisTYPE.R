#'@title Determine the type stored at key
#'@export
redisTYPE <- function( key, Rc) {
	cmd <- "TYPE"
	redisCommand(Rc, cmd, list(key))
}
