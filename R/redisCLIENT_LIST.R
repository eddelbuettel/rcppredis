#'@title Get the list of client connections
#'@export
redisCLIENT_LIST <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CLIENT LIST"
	redisCommand(Rc, cmd)
}
