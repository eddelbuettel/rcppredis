#'@title Stop listening for messages posted to channels matching the given patterns
#'@export
redisPUNSUBSCRIBE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PUNSUBSCRIBE"
	redisCommand(Rc, cmd)
}
