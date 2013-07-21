#'@title Rename a key
#'@export
redisRENAME <- function( key,  newkey, Rc) {
	cmd <- "RENAME"
	redisCommand(Rc, cmd, list(key, newkey))
}
