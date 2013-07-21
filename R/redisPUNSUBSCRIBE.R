#'@title Stop listening for messages posted to channels matching the given patterns
#'@export
redisPUNSUBSCRIBE <- function(Rc) {
	cmd <- "PUNSUBSCRIBE"
	redisCommand(Rc, cmd)
}
