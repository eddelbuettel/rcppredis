#'@title Determine the index of a member in a sorted set
#'@export
redisZRANK <- function( key,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZRANK"
	redisCommand(Rc, cmd, list(key, member))
}
