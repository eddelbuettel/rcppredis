#'@title Reset the stats returned by INFO
#'@export
redisCONFIG_RESETSTAT <- function(Rc) {
	cmd <- "CONFIG RESETSTAT"
	redisCommand(Rc, cmd)
}
