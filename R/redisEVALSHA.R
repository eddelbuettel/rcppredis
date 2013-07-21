#'@title Execute a Lua script server side
#'@export
redisEVALSHA <- function( sha, Rc) {
	cmd <- "EVALSHA"
	redisCommand(Rc, cmd, list(sha))
}
