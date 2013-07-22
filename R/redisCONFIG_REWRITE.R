#'@title Rewrite the configuration file with the in memory configuration
#'@export
redisCONFIG_REWRITE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "CONFIG REWRITE"
	redisCommand(Rc, cmd)
}
