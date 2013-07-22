#'@title Inspect the internals of Redis objects
#'@export
redisOBJECT <- function( subcommand, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "OBJECT"
	redisCommand(Rc, cmd, list(subcommand))
}
