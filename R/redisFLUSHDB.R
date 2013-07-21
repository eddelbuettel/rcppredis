#'@title Remove all keys from the current database
#'@export
redisFLUSHDB <- function(Rc) {
	cmd <- "FLUSHDB"
	redisCommand(Rc, cmd)
}
