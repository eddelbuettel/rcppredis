#'@title Synchronously save the dataset to disk and then shut down the server
#'@export
redisSHUTDOWN <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SHUTDOWN"
	redisCommand(Rc, cmd)
}
