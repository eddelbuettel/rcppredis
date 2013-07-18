#'@title Remove all keys from the current database
#'@export
redisFLUSHDB <- function(Rc) {
	cmd <- sprintf("FLUSHDB ")
	redisCommand(cmd, Rc)
}
