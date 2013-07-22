#'@title Synchronously save the dataset to disk
#'@export
redisSAVE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SAVE"
	redisCommand(Rc, cmd)
}
