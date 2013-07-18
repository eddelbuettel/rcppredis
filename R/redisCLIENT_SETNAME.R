#'@title Set the current connection name
#'@export
redisCLIENT_SETNAME <- function( connection, Rc) {
	cmd <- sprintf("CLIENT SETNAME %s", connection)
	redisCommand(cmd, Rc)
}
