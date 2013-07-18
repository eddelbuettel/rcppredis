#'@title Determine if a hash field exists
#'@export
redisHEXISTS <- function( key,  field, Rc) {
	cmd <- sprintf("HEXISTS %s %s", key, field)
	redisCommand(cmd, Rc)
}
