#'@title Rename a key
#'@export
redisRENAME <- function( key,  newkey, Rc) {
	cmd <- sprintf("RENAME %s %s", key, newkey)
	redisCommand(cmd, Rc)
}
