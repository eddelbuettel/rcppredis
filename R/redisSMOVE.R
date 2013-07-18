#'@title Move a member from one set to another
#'@export
redisSMOVE <- function( source,  destination,  member, Rc) {
	cmd <- sprintf("SMOVE %s %s %s", source, destination, member)
	redisCommand(cmd, Rc)
}
