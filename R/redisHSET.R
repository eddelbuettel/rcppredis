#'@title Set the string value of a hash field
#'@export
redisHSET <- function( key,  field,  value, Rc) {
	cmd <- sprintf("HSET %s %s %s", key, field, value)
	redisCommand(cmd, Rc)
}
