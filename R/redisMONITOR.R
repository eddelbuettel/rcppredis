#'@title Listen for all requests received by the server in real time
#'@export
redisMONITOR <- function(Rc) {
	cmd <- sprintf("MONITOR ")
	redisCommand(cmd, Rc)
}
