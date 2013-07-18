#'@title Make the server a slave of another instance, or promote it as master
#'@export
redisSLAVEOF <- function( host,  port, Rc) {
	cmd <- sprintf("SLAVEOF %s %s", host, port)
	redisCommand(cmd, Rc)
}
