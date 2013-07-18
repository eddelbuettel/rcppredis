#'@title Manages the Redis slow queries log
#'@export
redisSLOWLOG <- function( subcommand, Rc) {
	cmd <- sprintf("SLOWLOG %s", subcommand)
	redisCommand(cmd, Rc)
}
