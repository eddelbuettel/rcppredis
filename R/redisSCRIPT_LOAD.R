#'@title Load the specified Lua script into the script cache.
#'@export
redisSCRIPT_LOAD <- function( script, Rc) {
	cmd <- sprintf("SCRIPT LOAD %s", script)
	redisCommand(cmd, Rc)
}
