#'@title Mark the start of a transaction block
#'@export
redisMULTI <- function(Rc) {
	cmd <- sprintf("MULTI ")
	redisCommand(cmd, Rc)
}
