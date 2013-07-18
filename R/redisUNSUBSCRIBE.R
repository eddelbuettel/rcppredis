#'@title Stop listening for messages posted to the given channels
#'@export
redisUNSUBSCRIBE <- function(Rc) {
	cmd <- sprintf("UNSUBSCRIBE ")
	redisCommand(cmd, Rc)
}
