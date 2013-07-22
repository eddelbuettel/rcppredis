#'@title Return the current server time
#'@export
redisTIME <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "TIME"
	redisCommand(Rc, cmd)
}
