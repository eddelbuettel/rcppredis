#'@title Set the value of an element in a list by its index
#'@export
redisLSET <- function( key,  index,  value, Rc) {
	cmd <- sprintf("LSET %s %s %s", key, index, value)
	redisCommand(cmd, Rc)
}
