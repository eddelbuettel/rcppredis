#'@title Subtract multiple sets
#'@export
redisSDIFF <- function( key, Rc) {
	cmd <- sprintf("SDIFF %s", key)
	redisCommand(cmd, Rc)
}
