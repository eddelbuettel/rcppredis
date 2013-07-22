#'@title Reset the stats returned by INFO
#'@export
redisCONFIG_RESETSTAT <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CONFIG RESETSTAT"
	redisCommand(Rc, cmd)
}
