#'@title Remove the last element in a list, append it to another list and return it
#'@export
redisRPOPLPUSH <- function( source,  destination, Rc) {
	cmd <- "RPOPLPUSH"
	redisCommand(Rc, cmd, list(source, destination))
}
