#'@title Sort the elements in a list, set or sorted set
#'@export
redisSORT <- function( key, Rc) {
	cmd <- "SORT"
	redisCommand(Rc, cmd, list(key))
}
