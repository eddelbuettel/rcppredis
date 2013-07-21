#'@title Inspect the state of the Pub/Sub subsystem
#'@export
redisPUBSUB <- function( subcommand, Rc) {
	cmd <- "PUBSUB"
	redisCommand(Rc, cmd, list(subcommand))
}
