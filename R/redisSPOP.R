#'@title Remove and return a random member from a set
#'@export
redisSPOP <- function( key, Rc) {
	cmd <- "SPOP"
	redisCommand(Rc, cmd, list(key))
}
