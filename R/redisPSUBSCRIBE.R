#'@title Listen for messages published to channels matching the given patterns
#'@export
redisPSUBSCRIBE <- function( pattern, Rc) {
	cmd <- "PSUBSCRIBE"
	redisCommand(Rc, cmd, list(pattern))
}
