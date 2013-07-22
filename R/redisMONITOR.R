#'@title Listen for all requests received by the server in real time
#'@export
redisMONITOR <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MONITOR"
	redisCommand(Rc, cmd)
}
