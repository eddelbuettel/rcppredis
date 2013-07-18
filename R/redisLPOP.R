#'@title Remove and get the first element in a list
#'@export
redisLPOP <- function( key, Rc) {
	cmd <- sprintf("LPOP %s", key)
	redisCommand(cmd, Rc)
}
