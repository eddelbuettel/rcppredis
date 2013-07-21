#'@title Get the length of the value stored in a key
#'@export
redisSTRLEN <- function( key, Rc) {
	cmd <- "STRLEN"
	redisCommand(Rc, cmd, list(key))
}
