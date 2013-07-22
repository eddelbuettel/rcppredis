#'@title Sort the elements in a list, set or sorted set
#'@export
redisSORT <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SORT"
	redisCommand(Rc, cmd, list(key))
}
