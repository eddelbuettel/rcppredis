#'@title Return the current server time
#'@export
redisTIME <- function(Rc) {
	cmd <- sprintf("TIME ")
	redisCommand(cmd, Rc)
}
