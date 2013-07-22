#'@title Close the connection
#'@export
redisQUIT <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "QUIT"
	redisCommand(Rc, cmd)
}
