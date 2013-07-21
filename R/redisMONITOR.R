#'@title Listen for all requests received by the server in real time
#'@export
redisMONITOR <- function(Rc) {
	cmd <- "MONITOR"
	redisCommand(Rc, cmd)
}
