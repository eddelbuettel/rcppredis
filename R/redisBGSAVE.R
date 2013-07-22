#'@title Asynchronously save the dataset to disk
#'@export
redisBGSAVE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BGSAVE"
	redisCommand(Rc, cmd)
}
