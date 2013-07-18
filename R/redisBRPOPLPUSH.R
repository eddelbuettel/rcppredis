#'@title Pop a value from a list, push it to another list and return it; or block until one is available
#'@export
redisBRPOPLPUSH <- function( source,  destination,  timeout, Rc) {
	cmd <- sprintf("BRPOPLPUSH %s %s %s", source, destination, timeout)
	redisCommand(cmd, Rc)
}
