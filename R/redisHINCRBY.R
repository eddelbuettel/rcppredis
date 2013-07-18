#'@title Increment the integer value of a hash field by the given number
#'@export
redisHINCRBY <- function( key,  field,  increment, Rc) {
	cmd <- sprintf("HINCRBY %s %s %s", key, field, increment)
	redisCommand(cmd, Rc)
}
