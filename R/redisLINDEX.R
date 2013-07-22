#'@title Get an element from a list by its index
#'@export
redisLINDEX <- function( key,  index, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LINDEX"
	redisCommand(Rc, cmd, list(key, index))
}
