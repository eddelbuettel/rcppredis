#'@title Get the current connection name
#'@export
redisCLIENT_GETNAME <- function(Rc) {
	cmd <- sprintf("CLIENT GETNAME ")
	redisCommand(cmd, Rc)
}
