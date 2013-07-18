#'@title Intersect multiple sets and store the resulting set in a key
#'@export
redisSINTERSTORE <- function( destination,  key, Rc) {
	cmd <- sprintf("SINTERSTORE %s %s", destination, key)
	redisCommand(cmd, Rc)
}
