#'@title Execute a Lua script server side
#'@export
redisEVAL <- function( script,  numkeys,  key, Rc) {
	cmd <- sprintf("EVAL %s %s %s", script, numkeys, key)
	redisCommand(cmd, Rc)
}
