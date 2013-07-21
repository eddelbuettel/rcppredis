#'@title Intersect multiple sets
#'@export
redisSINTER <- function( key, Rc) {
	cmd <- "SINTER"
	redisCommand(Rc, cmd, list(key))
}
