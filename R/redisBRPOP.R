#'@title Remove and get the last element in a list, or block until one is available
#'@export
redisBRPOP <- function( key, Rc) {
	cmd <- "BRPOP"
	redisCommand(Rc, cmd, list(key))
}
