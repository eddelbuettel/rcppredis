#'@title Return a range of members in a sorted set, by index
#'@export
redisZRANGE <- function( key,  start,  stop, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZRANGE"
	redisCommand(Rc, cmd, list(key, start, stop))
}
