#'@title Post a message to a channel
#'@export
redisPUBLISH <- function( channel,  message, Rc) {
	cmd <- sprintf("PUBLISH %s %s", channel, message)
	redisCommand(cmd, Rc)
}
