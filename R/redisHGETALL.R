#'@title Get all the fields and values in a hash
#'@export
redisHGETALL <- function( key, Rc) {
	cmd <- sprintf("HGETALL %s", key)
	redisCommand(cmd, Rc)
}
