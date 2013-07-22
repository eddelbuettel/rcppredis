#'@title Get information and statistics about the server
#'@export
redisINFO <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "INFO"
	redisCommand(Rc, cmd)
}
