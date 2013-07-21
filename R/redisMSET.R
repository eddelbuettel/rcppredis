#'@title Set multiple keys to multiple values
#'@export
redisMSET <- function( key,  value, Rc) {
	cmd <- "MSET"
	redisCommand(Rc, cmd, list(key, value))
}
