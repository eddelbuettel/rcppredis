#'@title Move a key to another database
#'@export
redisMOVE <- function( key,  db, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MOVE"
	redisCommand(Rc, cmd, list(key, db))
}
