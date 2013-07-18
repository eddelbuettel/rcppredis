#'@title Get the number of members in a set
#'@export
redisSCARD <- function( key, Rc) {
	cmd <- sprintf("SCARD %s", key)
	redisCommand(cmd, Rc)
}
