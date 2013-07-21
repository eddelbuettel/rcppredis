#'@title Set the value of an element in a list by its index
#'@export
redisLSET <- function( key,  index,  value, Rc) {
	cmd <- "LSET"
	redisCommand(Rc, cmd, list(key, index, value))
}
