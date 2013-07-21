#'@title Insert an element before or after another element in a list
#'@export
redisLINSERT <- function( key, Rc) {
	cmd <- "LINSERT"
	redisCommand(Rc, cmd, list(key))
}
