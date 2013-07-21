#'@title Move a key to another database
#'@export
redisMOVE <- function( key,  db, Rc) {
	cmd <- "MOVE"
	redisCommand(Rc, cmd, list(key, db))
}
