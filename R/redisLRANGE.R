#'@title Get a range of elements from a list
#'@export
redisLRANGE <- function( key,  start,  stop, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LRANGE"
	redisCommand(Rc, cmd, list(key, start, stop))
}
