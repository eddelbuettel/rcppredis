#'@title Kill the connection of a client
#'@export
redisCLIENT_KILL <- function( ip, Rc) {
	cmd <- "CLIENT KILL"
	redisCommand(Rc, cmd, list(ip))
}
