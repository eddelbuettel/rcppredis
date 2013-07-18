#'@title Get the list of client connections
#'@export
redisCLIENT_LIST <- function(Rc) {
	cmd <- sprintf("CLIENT LIST ")
	redisCommand(cmd, Rc)
}
