#'@title Inspect the state of the Pub/Sub subsystem
#'@export
redisPUBSUB <- function( subcommand, Rc) {
	cmd <- sprintf("PUBSUB %s", subcommand)
	redisCommand(cmd, Rc)
}
