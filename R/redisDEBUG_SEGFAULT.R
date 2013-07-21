#'@title Make the server crash
#'@export
redisDEBUG_SEGFAULT <- function(Rc) {
	cmd <- "DEBUG SEGFAULT"
	redisCommand(Rc, cmd)
}
