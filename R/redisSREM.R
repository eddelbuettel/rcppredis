#'@title Remove one or more members from a set
#'@export
redisSREM <- function( key,  member, Rc) {
	cmd <- "SREM"
	redisCommand(Rc, cmd, list(key, member))
}
