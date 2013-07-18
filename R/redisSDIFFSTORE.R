#'@title Subtract multiple sets and store the resulting set in a key
#'@export
redisSDIFFSTORE <- function( destination,  key, Rc) {
	cmd <- sprintf("SDIFFSTORE %s %s", destination, key)
	redisCommand(cmd, Rc)
}
