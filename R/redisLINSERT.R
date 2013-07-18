#'@title Insert an element before or after another element in a list
#'@export
redisLINSERT <- function( key, Rc) {
	cmd <- sprintf("LINSERT %s", key)
	redisCommand(cmd, Rc)
}
