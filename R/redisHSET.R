#'@title Set the string value of a hash field
#'@export
redisHSET <- function( key,  field,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HSET"
	redisCommand(Rc, cmd, list(key, field, value))
}
