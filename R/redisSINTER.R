#'@title Intersect multiple sets
#'@export
redisSINTER <- function( key, Rc) {
	cmd <- sprintf("SINTER %s", key)
	redisCommand(cmd, Rc)
}
