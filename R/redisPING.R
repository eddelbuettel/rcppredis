#'@title Ping the server
#'@export
redisPING <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PING"
	redisCommand(Rc, cmd)
}
