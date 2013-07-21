#'@title Stop listening for messages posted to the given channels
#'@export
redisUNSUBSCRIBE <- function(Rc) {
	cmd <- "UNSUBSCRIBE"
	redisCommand(Rc, cmd)
}
