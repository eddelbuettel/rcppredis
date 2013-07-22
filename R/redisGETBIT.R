#'@title Returns the bit value at offset in the string value stored at key
#'@export
redisGETBIT <- function( key,  offset, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "GETBIT"
	redisCommand(Rc, cmd, list(key, offset))
}
