#'@title Forget about all watched keys
#'@export
redisUNWATCH <- function(Rc) {
	cmd <- sprintf("UNWATCH ")
	redisCommand(cmd, Rc)
}
