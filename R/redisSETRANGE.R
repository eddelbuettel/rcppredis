#'@title Overwrite part of a string at key starting at the specified offset
#'@export
redisSETRANGE <- function( key,  offset,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SETRANGE"
	redisCommand(Rc, cmd, list(key, offset, value))
}
