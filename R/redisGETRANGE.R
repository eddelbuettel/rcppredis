#'@title Get a substring of the string stored at a key
#'@export
redisGETRANGE <- function( key,  start,  end, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "GETRANGE"
	redisCommand(Rc, cmd, list(key, start, end))
}
