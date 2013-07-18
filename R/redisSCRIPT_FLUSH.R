#'@title Remove all the scripts from the script cache.
#'@export
redisSCRIPT_FLUSH <- function(Rc) {
	cmd <- sprintf("SCRIPT FLUSH ")
	redisCommand(cmd, Rc)
}
