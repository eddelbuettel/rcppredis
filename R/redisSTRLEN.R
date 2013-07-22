#'@title Get the length of the value stored in a key
#'@export
redisSTRLEN <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "STRLEN"
	redisCommand(Rc, cmd, list(key))
}
