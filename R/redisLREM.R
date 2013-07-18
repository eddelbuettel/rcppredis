#'@title Remove elements from a list
#'@export
redisLREM <- function( key,  count,  value, Rc) {
	cmd <- sprintf("LREM %s %s %s", key, count, value)
	redisCommand(cmd, Rc)
}
