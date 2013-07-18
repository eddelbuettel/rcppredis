#'@title Get information and statistics about the server
#'@export
redisINFO <- function(Rc) {
	cmd <- sprintf("INFO ")
	redisCommand(cmd, Rc)
}
