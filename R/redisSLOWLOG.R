#'@title Manages the Redis slow queries log
#'@export
redisSLOWLOG <- function( subcommand, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SLOWLOG"
	redisCommand(Rc, cmd, list(subcommand))
}
