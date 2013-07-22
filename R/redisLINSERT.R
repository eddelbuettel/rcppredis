#'@title Insert an element before or after another element in a list
#'@export
redisLINSERT <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LINSERT"
	redisCommand(Rc, cmd, list(key))
}
