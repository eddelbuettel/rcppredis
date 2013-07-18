#'@title Remove and get the last element in a list
#'@export
redisRPOP <- function( key, Rc) {
	cmd <- sprintf("RPOP %s", key)
	redisCommand(cmd, Rc)
}
