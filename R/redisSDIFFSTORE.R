#'@title Subtract multiple sets and store the resulting set in a key
#'@export
redisSDIFFSTORE <- function( destination,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SDIFFSTORE"
	redisCommand(Rc, cmd, list(destination, key))
}
