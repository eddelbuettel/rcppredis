#'@title Get the number of members in a set
#'@export
redisSCARD <- function( key, Rc) {
	cmd <- "SCARD"
	redisCommand(Rc, cmd, list(key))
}
