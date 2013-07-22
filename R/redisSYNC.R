#'@title Internal command used for replication
#'@export
redisSYNC <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SYNC"
	redisCommand(Rc, cmd)
}
