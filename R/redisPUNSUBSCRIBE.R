#'@title Stop listening for messages posted to channels matching the given patterns
#'@export
redisPUNSUBSCRIBE <- function(Rc) {
	cmd <- sprintf("PUNSUBSCRIBE ")
	redisCommand(cmd, Rc)
}
