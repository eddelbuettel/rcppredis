#'@title Return the number of keys in the selected database
#'@export
redisDBSIZE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DBSIZE"
	redisCommand(Rc, cmd)
}
