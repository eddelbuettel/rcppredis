#'@title Determine the type stored at key
#'@export
redisTYPE <- function( key, Rc) {
	cmd <- sprintf("TYPE %s", key)
	redisCommand(cmd, Rc)
}
