#'@title Get the time to live for a key
#'@export
redisTTL <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "TTL"
	redisCommand(Rc, cmd, list(key))
}
