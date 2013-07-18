#'@title Check existence of scripts in the script cache.
#'@export
redisSCRIPT_EXISTS <- function( script, Rc) {
	cmd <- sprintf("SCRIPT EXISTS %s", script)
	redisCommand(cmd, Rc)
}
