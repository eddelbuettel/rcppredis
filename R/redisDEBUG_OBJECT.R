#'@title Get debugging information about a key
#'@export
redisDEBUG_OBJECT <- function( key, Rc) {
	cmd <- "DEBUG OBJECT"
	redisCommand(Rc, cmd, list(key))
}
