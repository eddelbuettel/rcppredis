#'@title Add multiple sorted sets and store the resulting sorted set in a new key
#'@export
redisZUNIONSTORE <- function( destination,  numkeys,  key, Rc) {
	cmd <- "ZUNIONSTORE"
	redisCommand(Rc, cmd, list(destination, numkeys, key))
}
