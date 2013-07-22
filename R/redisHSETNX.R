#'@title Set the value of a hash field, only if the field does not exist
#'@export
redisHSETNX <- function( key,  field,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HSETNX"
	redisCommand(Rc, cmd, list(key, field, value))
}
