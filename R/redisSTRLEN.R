#'@title Get the length of the value stored in a key
#'@export
redisSTRLEN <- function( key, Rc) {
	cmd <- sprintf("STRLEN %s", key)
	redisCommand(cmd, Rc)
}
