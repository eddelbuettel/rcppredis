#'@title Make the server crash
#'@export
redisDEBUG_SEGFAULT <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DEBUG SEGFAULT"
	redisCommand(Rc, cmd)
}
