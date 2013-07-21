#'@title Set the current connection name
#'@export
redisCLIENT_SETNAME <- function( connection, Rc) {
	cmd <- "CLIENT SETNAME"
	redisCommand(Rc, cmd, list(connection))
}
