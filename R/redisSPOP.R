#'@title Remove and return a random member from a set
#'@export
redisSPOP <- function( key, Rc) {
	cmd <- sprintf("SPOP %s", key)
	redisCommand(cmd, Rc)
}
