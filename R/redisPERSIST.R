#'@title Remove the expiration from a key
#'@export
redisPERSIST <- function( key, Rc) {
	cmd <- sprintf("PERSIST %s", key)
	redisCommand(cmd, Rc)
}
