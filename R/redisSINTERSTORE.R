#'@title Intersect multiple sets and store the resulting set in a key
#'@export
redisSINTERSTORE <- function( destination,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SINTERSTORE"
	redisCommand(Rc, cmd, list(destination, key))
}
