#'@title Remove elements from a list
#'@export
redisLREM <- function( key,  count,  value, Rc) {
	cmd <- "LREM"
	redisCommand(Rc, cmd, list(key, count, value))
}
