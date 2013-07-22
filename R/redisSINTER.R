#'@title Intersect multiple sets
#'@export
redisSINTER <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SINTER"
	redisCommand(Rc, cmd, list(key))
}
