#'@title Get the value of a configuration parameter
#'@export
redisCONFIG_GET <- function( parameter, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CONFIG GET"
	redisCommand(Rc, cmd, list(parameter))
}
