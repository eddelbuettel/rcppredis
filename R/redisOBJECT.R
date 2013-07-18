#'@title Inspect the internals of Redis objects
#'@export
redisOBJECT <- function( subcommand, Rc) {
	cmd <- sprintf("OBJECT %s", subcommand)
	redisCommand(cmd, Rc)
}
