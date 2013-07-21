#'@title Determine if a hash field exists
#'@export
redisHEXISTS <- function( key,  field, Rc) {
	cmd <- "HEXISTS"
	redisCommand(Rc, cmd, list(key, field))
}
