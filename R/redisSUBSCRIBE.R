#'@title Listen for messages published to the given channels
#'@export
redisSUBSCRIBE <- function( channel, Rc) {
	cmd <- sprintf("SUBSCRIBE %s", channel)
	redisCommand(cmd, Rc)
}
