#'@title Get the values of all the given hash fields
#'@export
redisHMGET <- function( key,  field, Rc) {
	cmd <- sprintf("HMGET %s %s", key, field)
	redisCommand(cmd, Rc)
}
