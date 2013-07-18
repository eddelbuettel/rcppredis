#'@title Remove and get the last element in a list, or block until one is available
#'@export
redisBRPOP <- function( key, Rc) {
	cmd <- sprintf("BRPOP %s", key)
	redisCommand(cmd, Rc)
}
