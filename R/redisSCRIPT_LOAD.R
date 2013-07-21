#'@title Load the specified Lua script into the script cache.
#'@export
redisSCRIPT_LOAD <- function( script, Rc) {
	cmd <- "SCRIPT LOAD"
	redisCommand(Rc, cmd, list(script))
}
