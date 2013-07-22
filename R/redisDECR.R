#'@title Decrement the integer value of a key by one
#'@export
redisDECR <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DECR"
	redisCommand(Rc, cmd, list(key))
}
