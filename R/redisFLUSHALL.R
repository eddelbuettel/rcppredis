#'@title Remove all keys from all databases
#'@export
redisFLUSHALL <- function(Rc) {
	cmd <- "FLUSHALL"
	redisCommand(Rc, cmd)
}
