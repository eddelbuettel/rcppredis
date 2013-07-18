#'@title Kill the script currently in execution.
#'@export
redisSCRIPT_KILL <- function(Rc) {
	cmd <- sprintf("SCRIPT KILL ")
	redisCommand(cmd, Rc)
}
