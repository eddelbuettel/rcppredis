#'@title Count set bits in a string
#'@export
redisBITCOUNT <- function( key, Rc) {
	cmd <- "BITCOUNT"
	redisCommand(Rc, cmd, list(key))
}
