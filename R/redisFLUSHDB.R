#'@title Remove all keys from the current database
#'@export
redisFLUSHDB <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "FLUSHDB"
	redisCommand(Rc, cmd)
}
