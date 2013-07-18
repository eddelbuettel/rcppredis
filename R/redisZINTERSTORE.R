#'@title Intersect multiple sorted sets and store the resulting sorted set in a new key
#'@export
redisZINTERSTORE <- function( destination,  numkeys,  key, Rc) {
	cmd <- sprintf("ZINTERSTORE %s %s %s", destination, numkeys, key)
	redisCommand(cmd, Rc)
}
