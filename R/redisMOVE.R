#'@title Move a key to another database
#'@export
redisMOVE <- function( key,  db, Rc) {
	cmd <- sprintf("MOVE %s %s", key, db)
	redisCommand(cmd, Rc)
}
