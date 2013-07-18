#'@title Get all the members in a set
#'@export
redisSMEMBERS <- function( key, Rc) {
	cmd <- sprintf("SMEMBERS %s", key)
	redisCommand(cmd, Rc)
}
