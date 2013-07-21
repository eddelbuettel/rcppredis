#'@title Manages the Redis slow queries log
#'@export
redisSLOWLOG <- function( subcommand, Rc) {
	cmd <- "SLOWLOG"
	redisCommand(Rc, cmd, list(subcommand))
}
