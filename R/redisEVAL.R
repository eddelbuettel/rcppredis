#'@title Execute a Lua script server side
#'@export
redisEVAL <- function( script,  numkeys,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "EVAL"
	redisCommand(Rc, cmd, list(script, numkeys, key))
}
