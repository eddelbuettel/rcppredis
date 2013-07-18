#'@title Get the number of fields in a hash
#'@export
redisHLEN <- function( key, Rc) {
	cmd <- sprintf("HLEN %s", key)
	redisCommand(cmd, Rc)
}
