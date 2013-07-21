#'@title Kill the script currently in execution.
#'@export
redisSCRIPT_KILL <- function(Rc) {
	cmd <- "SCRIPT KILL"
	redisCommand(Rc, cmd)
}
