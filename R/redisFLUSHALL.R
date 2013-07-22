#'@title Remove all keys from all databases
#'@export
redisFLUSHALL <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "FLUSHALL"
	redisCommand(Rc, cmd)
}
