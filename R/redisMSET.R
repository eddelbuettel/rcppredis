#'@title Set multiple keys to multiple values
#'@export
redisMSET <- function( key,  value, Rc) {
	cmd <- sprintf("MSET %s %s", key, value)
	redisCommand(cmd, Rc)
}
