#'@title Forget about all watched keys
#'@export
redisUNWATCH <- function(Rc) {
	cmd <- "UNWATCH"
	redisCommand(Rc, cmd)
}
