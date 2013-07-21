#'@title Remove the expiration from a key
#'@export
redisPERSIST <- function( key, Rc) {
	cmd <- "PERSIST"
	redisCommand(Rc, cmd, list(key))
}
