#'@title Intersect multiple sorted sets and store the resulting sorted set in a new key
#'@export
redisZINTERSTORE <- function( destination,  numkeys,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZINTERSTORE"
	redisCommand(Rc, cmd, list(destination, numkeys, key))
}
