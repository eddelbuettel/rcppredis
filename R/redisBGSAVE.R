#'@title Asynchronously save the dataset to disk
#'@export
redisBGSAVE <- function(Rc) {
	cmd <- sprintf("BGSAVE ")
	redisCommand(cmd, Rc)
}
