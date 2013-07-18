#'@title Kill the connection of a client
#'@export
redisCLIENT_KILL <- function( ip, Rc) {
	cmd <- sprintf("CLIENT KILL %s", ip)
	redisCommand(cmd, Rc)
}
