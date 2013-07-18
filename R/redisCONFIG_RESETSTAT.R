#'@title Reset the stats returned by INFO
#'@export
redisCONFIG_RESETSTAT <- function(Rc) {
	cmd <- sprintf("CONFIG RESETSTAT ")
	redisCommand(cmd, Rc)
}
