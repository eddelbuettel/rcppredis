#'@title Determine if a key exists
#'@export
redisEXISTS <- function( key, Rc) {
	cmd <- sprintf("EXISTS %s", key)
	redisCommand(cmd, Rc)
}
