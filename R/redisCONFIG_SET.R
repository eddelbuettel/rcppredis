#'@title Set a configuration parameter to the given value
#'@export
redisCONFIG_SET <- function( parameter,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CONFIG SET"
	redisCommand(Rc, cmd, list(parameter, value))
}
