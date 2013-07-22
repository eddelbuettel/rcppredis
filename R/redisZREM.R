#'@title Remove one or more members from a sorted set
#'@export
redisZREM <- function( key,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZREM"
	redisCommand(Rc, cmd, list(key, member))
}
