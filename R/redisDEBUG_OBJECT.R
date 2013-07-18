#'@title Get debugging information about a key
#'@export
redisDEBUG_OBJECT <- function( key, Rc) {
	cmd <- sprintf("DEBUG OBJECT %s", key)
	redisCommand(cmd, Rc)
}
