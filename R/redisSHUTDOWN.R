#'@title Synchronously save the dataset to disk and then shut down the server
#'@export
redisSHUTDOWN <- function(Rc) {
	cmd <- sprintf("SHUTDOWN ")
	redisCommand(cmd, Rc)
}
