#'@title Return a range of members in a sorted set, by score, with scores ordered from high to low
#'@export
redisZREVRANGEBYSCORE <- function( key,  max,  min, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZREVRANGEBYSCORE"
	redisCommand(Rc, cmd, list(key, max, min))
}
