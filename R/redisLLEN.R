#'@title Get the length of a list
#'@export
redisLLEN <- function( key, Rc) {
	cmd <- "LLEN"
	redisCommand(Rc, cmd, list(key))
}
