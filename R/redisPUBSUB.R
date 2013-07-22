#'@title Inspect the state of the Pub/Sub subsystem
#'@export
redisPUBSUB <- function( subcommand, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PUBSUB"
	redisCommand(Rc, cmd, list(subcommand))
}
