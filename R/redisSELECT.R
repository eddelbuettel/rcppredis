#'@title Change the selected database for the current connection
#'@export
redisSELECT <- function( index, Rc) {
	cmd <- "SELECT"
	redisCommand(Rc, cmd, list(index))
}
