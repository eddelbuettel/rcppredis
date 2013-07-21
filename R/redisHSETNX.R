#'@title Set the value of a hash field, only if the field does not exist
#'@export
redisHSETNX <- function( key,  field,  value, Rc) {
	cmd <- "HSETNX"
	redisCommand(Rc, cmd, list(key, field, value))
}
