#'@title Make the server a slave of another instance, or promote it as master
#'@export
redisSLAVEOF <- function( host,  port, Rc) {
	cmd <- "SLAVEOF"
	redisCommand(Rc, cmd, list(host, port))
}
