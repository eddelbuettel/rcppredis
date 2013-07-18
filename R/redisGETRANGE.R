#'@title Get a substring of the string stored at a key
#'@export
redisGETRANGE <- function( key,  start,  end, Rc) {
	cmd <- sprintf("GETRANGE %s %s %s", key, start, end)
	redisCommand(cmd, Rc)
}
