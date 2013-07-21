#'@title Close the connection
#'@export
redisQUIT <- function(Rc) {
	cmd <- "QUIT"
	redisCommand(Rc, cmd)
}
