#'@title Remove one or more members from a set
#'@export
redisSREM <- function( key,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SREM"
	redisCommand(Rc, cmd, list(key, member))
}
