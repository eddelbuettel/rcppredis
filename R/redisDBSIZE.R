#'@title Return the number of keys in the selected database
#'@export
redisDBSIZE <- function(Rc) {
	cmd <- "DBSIZE"
	redisCommand(Rc, cmd)
}
