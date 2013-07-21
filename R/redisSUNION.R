#'@title Add multiple sets
#'@export
redisSUNION <- function( key, Rc) {
	cmd <- "SUNION"
	redisCommand(Rc, cmd, list(key))
}
