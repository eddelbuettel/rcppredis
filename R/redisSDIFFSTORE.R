#'@title Subtract multiple sets and store the resulting set in a key
#'@export
redisSDIFFSTORE <- function( destination,  key, Rc) {
	cmd <- "SDIFFSTORE"
	redisCommand(Rc, cmd, list(destination, key))
}
