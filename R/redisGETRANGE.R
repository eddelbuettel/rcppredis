#'@title Get a substring of the string stored at a key
#'@export
redisGETRANGE <- function( key,  start,  end, Rc) {
	cmd <- "GETRANGE"
	redisCommand(Rc, cmd, list(key, start, end))
}
