#'@title Get the list of client connections
#'@export
redisCLIENT_LIST <- function(Rc) {
	cmd <- "CLIENT LIST"
	redisCommand(Rc, cmd)
}
