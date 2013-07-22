#'@title Count set bits in a string
#'@export
redisBITCOUNT <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BITCOUNT"
	redisCommand(Rc, cmd, list(key))
}
