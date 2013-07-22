#'@title Kill the script currently in execution.
#'@export
redisSCRIPT_KILL <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SCRIPT KILL"
	redisCommand(Rc, cmd)
}
