#'@title Sort the elements in a list, set or sorted set
#'@export
redisSORT <- function( key, Rc) {
	cmd <- sprintf("SORT %s", key)
	redisCommand(cmd, Rc)
}
