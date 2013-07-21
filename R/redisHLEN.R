#'@title Get the number of fields in a hash
#'@export
redisHLEN <- function( key, Rc) {
	cmd <- "HLEN"
	redisCommand(Rc, cmd, list(key))
}
