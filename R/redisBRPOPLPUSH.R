#'@title Pop a value from a list, push it to another list and return it; or block until one is available
#'@export
redisBRPOPLPUSH <- function( source,  destination,  timeout, Rc) {
	cmd <- "BRPOPLPUSH"
	redisCommand(Rc, cmd, list(source, destination, timeout))
}
