#'@title Set multiple hash fields to multiple values
#'@export
redisHMSET <- function( key,  field,  value, Rc) {
	cmd <- sprintf("HMSET %s %s %s", key, field, value)
	redisCommand(cmd, Rc)
}
