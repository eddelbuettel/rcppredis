#'@title Kill the connection of a client
#'@export
redisCLIENT_KILL <- function( ip, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CLIENT KILL"
	redisCommand(Rc, cmd, list(ip))
}
