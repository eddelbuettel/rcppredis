#'@title Internal command used for replication
#'@export
redisSYNC <- function(Rc) {
	cmd <- "SYNC"
	redisCommand(Rc, cmd)
}
