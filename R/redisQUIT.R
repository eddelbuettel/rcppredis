#'@title Close the connection
#'@export
redisQUIT <- function(Rc) {
	cmd <- sprintf("QUIT ")
	redisCommand(cmd, Rc)
}
