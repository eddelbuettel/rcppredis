#'@title Set the value of a hash field, only if the field does not exist
#'@export
redisHSETNX <- function( key,  field,  value, Rc) {
	cmd <- sprintf("HSETNX %s %s %s", key, field, value)
	redisCommand(cmd, Rc)
}
