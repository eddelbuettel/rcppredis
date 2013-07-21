#'@title Intersect multiple sorted sets and store the resulting sorted set in a new key
#'@export
redisZINTERSTORE <- function( destination,  numkeys,  key, Rc) {
	cmd <- "ZINTERSTORE"
	redisCommand(Rc, cmd, list(destination, numkeys, key))
}
