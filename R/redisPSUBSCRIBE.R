#'@title Listen for messages published to channels matching the given patterns
#'@export
redisPSUBSCRIBE <- function( pattern, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PSUBSCRIBE"
	redisCommand(Rc, cmd, list(pattern))
}
