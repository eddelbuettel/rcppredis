#'@title Execute a Lua script server side
#'@export
redisEVALSHA <- function( sha, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "EVALSHA"
	redisCommand(Rc, cmd, list(sha))
}
