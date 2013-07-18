#'@title Get the values of all the given keys
#'@export
redisMGET <- function( key, Rc) {
	cmd <- sprintf("MGET %s", key)
	redisCommand(cmd, Rc)
}
