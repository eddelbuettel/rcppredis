#'@title Get the values of all the given hash fields
#'@export
redisHMGET <- function( key,  field, Rc) {
	cmd <- "HMGET"
	redisCommand(Rc, cmd, list(key, field))
}
