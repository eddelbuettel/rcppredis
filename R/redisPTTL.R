#'@title Get the time to live for a key in milliseconds
#'@export
redisPTTL <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PTTL"
	redisCommand(Rc, cmd, list(key))
}
