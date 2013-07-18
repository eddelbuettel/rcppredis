#'@title Authenticate to the server
#'@export
redisAUTH <- function( password, Rc) {
	cmd <- sprintf("AUTH %s", password)
	redisCommand(cmd, Rc)
}
