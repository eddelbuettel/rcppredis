#'@title Listen for messages published to channels matching the given patterns
#'@export
redisPSUBSCRIBE <- function( pattern, Rc) {
	cmd <- sprintf("PSUBSCRIBE %s", pattern)
	redisCommand(cmd, Rc)
}
