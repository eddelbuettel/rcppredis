#'@title Set the string value of a key and return its old value
#'@export
redisGETSET <- function( key,  value, Rc) {
	cmd <- sprintf("GETSET %s %s", key, value)
	redisCommand(cmd, Rc)
}
