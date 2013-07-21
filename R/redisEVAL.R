#'@title Execute a Lua script server side
#'@export
redisEVAL <- function( script,  numkeys,  key, Rc) {
	cmd <- "EVAL"
	redisCommand(Rc, cmd, list(script, numkeys, key))
}
