#'@title Watch the given keys to determine execution of the MULTI/EXEC block
#'@export
redisWATCH <- function( key, Rc) {
	cmd <- sprintf("WATCH %s", key)
	redisCommand(cmd, Rc)
}
