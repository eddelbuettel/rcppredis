#'@title Count the members in a sorted set with scores within the given values
#'@export
redisZCOUNT <- function( key,  min,  max, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZCOUNT"
	redisCommand(Rc, cmd, list(key, min, max))
}
