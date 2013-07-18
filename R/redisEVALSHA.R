#'@title Execute a Lua script server side
#'@export
redisEVALSHA <- function( sha, Rc) {
	cmd <- sprintf("EVALSHA %s", sha)
	redisCommand(cmd, Rc)
}
