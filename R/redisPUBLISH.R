#'@title Post a message to a channel
#'@export
redisPUBLISH <- function( channel,  message, Rc) {
	cmd <- "PUBLISH"
	redisCommand(Rc, cmd, list(channel, message))
}
