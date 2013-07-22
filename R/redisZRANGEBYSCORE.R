#'@title Return a range of members in a sorted set, by score
#'@export
redisZRANGEBYSCORE <- function( key,  min,  max, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZRANGEBYSCORE"
	redisCommand(Rc, cmd, list(key, min, max))
}
