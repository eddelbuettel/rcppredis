#'@title Get all the values in a hash
#'@export
redisHVALS <- function( key, Rc) {
	cmd <- sprintf("HVALS %s", key)
	redisCommand(cmd, Rc)
}
