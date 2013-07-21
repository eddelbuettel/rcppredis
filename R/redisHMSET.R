#'@title Set multiple hash fields to multiple values
#'@export
redisHMSET <- function( key,  field,  value, Rc) {
	cmd <- "HMSET"
	redisCommand(Rc, cmd, list(key, field, value))
}
