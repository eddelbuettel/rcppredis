#'@title Delete a key
#'@export
redisDEL <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DEL"
	redisCommand(Rc, cmd, list(key))
}
