#'@title Watch the given keys to determine execution of the MULTI/EXEC block
#'@export
redisWATCH <- function( key, Rc) {
	cmd <- "WATCH"
	redisCommand(Rc, cmd, list(key))
}
