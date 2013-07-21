#'@title Remove all the scripts from the script cache.
#'@export
redisSCRIPT_FLUSH <- function(Rc) {
	cmd <- "SCRIPT FLUSH"
	redisCommand(Rc, cmd)
}
