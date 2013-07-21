#'@title Inspect the internals of Redis objects
#'@export
redisOBJECT <- function( subcommand, Rc) {
	cmd <- "OBJECT"
	redisCommand(Rc, cmd, list(subcommand))
}
