#'@title Get information and statistics about the server
#'@export
redisINFO <- function(Rc) {
	cmd <- "INFO"
	redisCommand(Rc, cmd)
}
