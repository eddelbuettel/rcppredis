#'@title Get the value of a hash field
#'@export
redisHGET <- function( key,  field, Rc) {
	cmd <- sprintf("HGET %s %s", key, field)
	redisCommand(cmd, Rc)
}
