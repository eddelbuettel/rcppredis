#'@title Decrement the integer value of a key by the given number
#'@export
redisDECRBY <- function( key,  decrement, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DECRBY"
	redisCommand(Rc, cmd, list(key, decrement))
}
