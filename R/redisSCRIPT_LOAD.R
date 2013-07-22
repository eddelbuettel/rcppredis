#'@title Load the specified Lua script into the script cache.
#'@export
redisSCRIPT_LOAD <- function( script, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SCRIPT LOAD"
	redisCommand(Rc, cmd, list(script))
}
