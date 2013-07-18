#'@title Get the value of a key
#'@export
redisGET <- function( key, Rc) {
	cmd <- sprintf("GET %s", key)
	redisCommand(cmd, Rc)
}
