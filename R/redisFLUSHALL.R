#'@title Remove all keys from all databases
#'@export
redisFLUSHALL <- function(Rc) {
	cmd <- sprintf("FLUSHALL ")
	redisCommand(cmd, Rc)
}
