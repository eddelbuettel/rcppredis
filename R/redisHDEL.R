#'@title Delete one or more hash fields
#'@export
redisHDEL <- function( key,  field, Rc) {
	cmd <- "HDEL"
	redisCommand(Rc, cmd, list(key, field))
}
