#'@title Get the length of a list
#'@export
redisLLEN <- function( key, Rc) {
	cmd <- sprintf("LLEN %s", key)
	redisCommand(cmd, Rc)
}
