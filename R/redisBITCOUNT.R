#'@title Count set bits in a string
#'@export
redisBITCOUNT <- function( key, Rc) {
	cmd <- sprintf("BITCOUNT %s", key)
	redisCommand(cmd, Rc)
}
