#'@title Get the value of a hash field
#'@export
redisHGET <- function( key,  field, Rc) {
	cmd <- "HGET"
	redisCommand(Rc, cmd, list(key, field))
}
