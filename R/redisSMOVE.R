#'@title Move a member from one set to another
#'@export
redisSMOVE <- function( source,  destination,  member, Rc) {
	cmd <- "SMOVE"
	redisCommand(Rc, cmd, list(source, destination, member))
}
