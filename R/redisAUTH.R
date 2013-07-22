#'@title Authenticate to the server
#'@export
redisAUTH <- function( password, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "AUTH"
	redisCommand(Rc, cmd, list(password))
}
