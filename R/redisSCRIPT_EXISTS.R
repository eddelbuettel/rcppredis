#'@title Check existence of scripts in the script cache.
#'@export
redisSCRIPT_EXISTS <- function( script, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SCRIPT EXISTS"
	redisCommand(Rc, cmd, list(script))
}
