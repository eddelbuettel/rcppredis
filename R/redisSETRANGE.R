#'@title Overwrite part of a string at key starting at the specified offset
#'@export
redisSETRANGE <- function( key,  offset,  value, Rc) {
	cmd <- "SETRANGE"
	redisCommand(Rc, cmd, list(key, offset, value))
}
