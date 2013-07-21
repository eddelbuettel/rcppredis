#'@title Delete a key
#'@export
redisDEL <- function( key, Rc) {
	cmd <- "DEL"
	redisCommand(Rc, cmd, list(key))
}
