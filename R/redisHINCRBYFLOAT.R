#'@title Increment the float value of a hash field by the given amount
#'@export
redisHINCRBYFLOAT <- function( key,  field,  increment, Rc) {
	cmd <- sprintf("HINCRBYFLOAT %s %s %s", key, field, increment)
	redisCommand(cmd, Rc)
}
