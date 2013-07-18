#'@title Get one or multiple random members from a set
#'@export
redisSRANDMEMBER <- function( key, Rc) {
	cmd <- sprintf("SRANDMEMBER %s", key)
	redisCommand(cmd, Rc)
}
