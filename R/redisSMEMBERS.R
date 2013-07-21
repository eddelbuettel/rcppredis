#'@title Get all the members in a set
#'@export
redisSMEMBERS <- function( key, Rc) {
	cmd <- "SMEMBERS"
	redisCommand(Rc, cmd, list(key))
}
