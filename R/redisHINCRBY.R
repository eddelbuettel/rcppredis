#'@title Increment the integer value of a hash field by the given number
#'@export
redisHINCRBY <- function( key,  field,  increment, Rc) {
	cmd <- "HINCRBY"
	redisCommand(Rc, cmd, list(key, field, increment))
}
