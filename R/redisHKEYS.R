#'@title Get all the fields in a hash
#'@export
redisHKEYS <- function( key, Rc) {
	cmd <- sprintf("HKEYS %s", key)
	redisCommand(cmd, Rc)
}
