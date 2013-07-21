#'@title Mark the start of a transaction block
#'@export
redisMULTI <- function(Rc) {
	cmd <- "MULTI"
	redisCommand(Rc, cmd)
}
