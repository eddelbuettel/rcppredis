#'@title Get the current connection name
#'@export
redisCLIENT_GETNAME <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CLIENT GETNAME"
	redisCommand(Rc, cmd)
}
