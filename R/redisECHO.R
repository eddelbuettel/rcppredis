#'@title Echo the given string
#'@export
redisECHO <- function( message, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ECHO"
	redisCommand(Rc, cmd, list(message))
}
