#'@title Synchronously save the dataset to disk
#'@export
redisSAVE <- function(Rc) {
	cmd <- "SAVE"
	redisCommand(Rc, cmd)
}
