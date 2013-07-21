#'@title Authenticate to the server
#'@export
redisAUTH <- function( password, Rc) {
	cmd <- "AUTH"
	redisCommand(Rc, cmd, list(password))
}
