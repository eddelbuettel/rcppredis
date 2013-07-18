#'@title Remove and get the first element in a list, or block until one is available
#'@export
redisBLPOP <- function( key, Rc) {
	cmd <- sprintf("BLPOP %s", key)
	redisCommand(cmd, Rc)
}
