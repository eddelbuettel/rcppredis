#'@title Ping the server
#'@export
redisPING <- function(Rc) {
	cmd <- "PING"
	redisCommand(Rc, cmd)
}
