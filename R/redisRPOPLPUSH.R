#'@title Remove the last element in a list, append it to another list and return it
#'@export
redisRPOPLPUSH <- function( source,  destination, Rc) {
	cmd <- sprintf("RPOPLPUSH %s %s", source, destination)
	redisCommand(cmd, Rc)
}
