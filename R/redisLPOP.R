#'@title Remove and get the first element in a list
#'@export
redisLPOP <- function( key, Rc) {
	cmd <- "LPOP"
	redisCommand(Rc, cmd, list(key))
}
