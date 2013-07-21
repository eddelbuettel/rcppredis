#'@title Rewrite the configuration file with the in memory configuration
#'@export
redisCONFIG_REWRITE <- function(Rc) {
	cmd <- "CONFIG REWRITE"
	redisCommand(Rc, cmd)
}
