#'@title Set the string value of a hash field
#'@export
redisHSET <- function( key,  field,  value, Rc) {
	cmd <- "HSET"
	redisCommand(Rc, cmd, list(key, field, value))
}
