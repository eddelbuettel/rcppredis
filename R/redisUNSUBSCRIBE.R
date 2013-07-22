#'@title Stop listening for messages posted to the given channels
#'@export
redisUNSUBSCRIBE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "UNSUBSCRIBE"
	redisCommand(Rc, cmd)
}
