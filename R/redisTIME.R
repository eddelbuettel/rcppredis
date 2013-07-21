#'@title Return the current server time
#'@export
redisTIME <- function(Rc) {
	cmd <- "TIME"
	redisCommand(Rc, cmd)
}
