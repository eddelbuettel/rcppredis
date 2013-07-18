#'@title Overwrite part of a string at key starting at the specified offset
#'@export
redisSETRANGE <- function( key,  offset,  value, Rc) {
	cmd <- sprintf("SETRANGE %s %s %s", key, offset, value)
	redisCommand(cmd, Rc)
}
