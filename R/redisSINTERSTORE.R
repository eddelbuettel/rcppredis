#'@title Intersect multiple sets and store the resulting set in a key
#'@export
redisSINTERSTORE <- function( destination,  key, Rc) {
	cmd <- "SINTERSTORE"
	redisCommand(Rc, cmd, list(destination, key))
}
