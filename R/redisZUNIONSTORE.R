#'@title Add multiple sorted sets and store the resulting sorted set in a new key
#'@export
redisZUNIONSTORE <- function( destination,  numkeys,  key, Rc) {
	cmd <- sprintf("ZUNIONSTORE %s %s %s", destination, numkeys, key)
	redisCommand(cmd, Rc)
}
