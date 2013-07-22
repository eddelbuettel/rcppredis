#'@title Get the number of members in a sorted set
#'@export
redisZCARD <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZCARD"
	redisCommand(Rc, cmd, list(key))
}
