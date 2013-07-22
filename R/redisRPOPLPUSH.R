#'@title Remove the last element in a list, append it to another list and return it
#'@export
redisRPOPLPUSH <- function( source,  destination, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RPOPLPUSH"
	redisCommand(Rc, cmd, list(source, destination))
}
