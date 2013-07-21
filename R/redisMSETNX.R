#'@title Set multiple keys to multiple values, only if none of the keys exist
#'@export
redisMSETNX <- function( key,  value, Rc) {
	cmd <- "MSETNX"
	redisCommand(Rc, cmd, list(key, value))
}
