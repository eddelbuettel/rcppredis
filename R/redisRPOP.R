#'@title Remove and get the last element in a list
#'@export
redisRPOP <- function( key, Rc) {
	cmd <- "RPOP"
	redisCommand(Rc, cmd, list(key))
}
