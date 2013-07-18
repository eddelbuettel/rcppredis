#'@title Synchronously save the dataset to disk
#'@export
redisSAVE <- function(Rc) {
	cmd <- sprintf("SAVE ")
	redisCommand(cmd, Rc)
}
