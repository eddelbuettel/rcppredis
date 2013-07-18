#'@title Change the selected database for the current connection
#'@export
redisSELECT <- function( index, Rc) {
	cmd <- sprintf("SELECT %s", index)
	redisCommand(cmd, Rc)
}
