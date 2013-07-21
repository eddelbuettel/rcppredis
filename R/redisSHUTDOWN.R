#'@title Synchronously save the dataset to disk and then shut down the server
#'@export
redisSHUTDOWN <- function(Rc) {
	cmd <- "SHUTDOWN"
	redisCommand(Rc, cmd)
}
