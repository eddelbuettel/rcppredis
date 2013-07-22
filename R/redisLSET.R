#'@title Set the value of an element in a list by its index
#'@export
redisLSET <- function( key,  index,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LSET"
	redisCommand(Rc, cmd, list(key, index, value))
}
