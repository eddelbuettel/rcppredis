#'@title Listen for messages published to the given channels
#'@export
redisSUBSCRIBE <- function( channel, Rc) {
	cmd <- "SUBSCRIBE"
	redisCommand(Rc, cmd, list(channel))
}
