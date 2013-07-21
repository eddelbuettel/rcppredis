#'@title Get all the fields in a hash
#'@export
redisHKEYS <- function( key, Rc) {
	cmd <- "HKEYS"
	redisCommand(Rc, cmd, list(key))
}
