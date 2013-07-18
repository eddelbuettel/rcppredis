#'@title Delete one or more hash fields
#'@export
redisHDEL <- function( key,  field, Rc) {
	cmd <- sprintf("HDEL %s %s", key, field)
	redisCommand(cmd, Rc)
}
