#'@title Echo the given string
#'@export
redisECHO <- function( message, Rc) {
	cmd <- "ECHO"
	redisCommand(Rc, cmd, list(message))
}
