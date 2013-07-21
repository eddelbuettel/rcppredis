#'@title Get the current connection name
#'@export
redisCLIENT_GETNAME <- function(Rc) {
	cmd <- "CLIENT GETNAME"
	redisCommand(Rc, cmd)
}
