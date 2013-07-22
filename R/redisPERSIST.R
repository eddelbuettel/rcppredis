#'@title Remove the expiration from a key
#'@export
redisPERSIST <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PERSIST"
	redisCommand(Rc, cmd, list(key))
}
