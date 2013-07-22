#'@title Get one or multiple random members from a set
#'@export
redisSRANDMEMBER <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SRANDMEMBER"
	redisCommand(Rc, cmd, list(key))
}
