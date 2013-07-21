#'@title Subtract multiple sets
#'@export
redisSDIFF <- function( key, Rc) {
	cmd <- "SDIFF"
	redisCommand(Rc, cmd, list(key))
}
