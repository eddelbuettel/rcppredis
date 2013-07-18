#'@title Echo the given string
#'@export
redisECHO <- function( message, Rc) {
	cmd <- sprintf("ECHO %s", message)
	redisCommand(cmd, Rc)
}
