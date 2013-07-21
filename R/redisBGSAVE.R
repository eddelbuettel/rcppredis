#'@title Asynchronously save the dataset to disk
#'@export
redisBGSAVE <- function(Rc) {
	cmd <- "BGSAVE"
	redisCommand(Rc, cmd)
}
