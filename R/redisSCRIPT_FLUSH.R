#'@title Remove all the scripts from the script cache.
#'@export
redisSCRIPT_FLUSH <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SCRIPT FLUSH"
	redisCommand(Rc, cmd)
}
