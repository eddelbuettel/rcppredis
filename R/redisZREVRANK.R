#'@title Determine the index of a member in a sorted set, with scores ordered from high to low
#'@export
redisZREVRANK <- function( key,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZREVRANK"
	redisCommand(Rc, cmd, list(key, member))
}
