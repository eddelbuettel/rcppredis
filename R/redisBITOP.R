#'@title Perform bitwise operations between strings
#'@export
redisBITOP <- function( operation,  destkey,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BITOP"
	redisCommand(Rc, cmd, list(operation, destkey, key))
}
