#'@title Set multiple hash fields to multiple values
#'@export
redisHMSET <- function( key,  field,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HMSET"
	redisCommand(Rc, cmd, list(key, field, value))
}
