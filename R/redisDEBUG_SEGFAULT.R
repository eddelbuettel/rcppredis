#'@title Make the server crash
#'@export
redisDEBUG_SEGFAULT <- function(Rc) {
	cmd <- sprintf("DEBUG SEGFAULT ")
	redisCommand(cmd, Rc)
}
