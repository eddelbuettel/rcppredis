#'@title Ping the server
#'@export
redisPING <- function(Rc) {
	cmd <- sprintf("PING ")
	redisCommand(cmd, Rc)
}
