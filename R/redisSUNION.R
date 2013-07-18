#'@title Add multiple sets
#'@export
redisSUNION <- function( key, Rc) {
	cmd <- sprintf("SUNION %s", key)
	redisCommand(cmd, Rc)
}
