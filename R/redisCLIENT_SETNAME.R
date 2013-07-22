#'@title Set the current connection name
#'@export
redisCLIENT_SETNAME <- function( connection, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CLIENT SETNAME"
	redisCommand(Rc, cmd, list(connection))
}
