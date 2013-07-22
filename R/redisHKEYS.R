#'@title Get all the fields in a hash
#'@export
redisHKEYS <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HKEYS"
	redisCommand(Rc, cmd, list(key))
}
