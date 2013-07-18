#'@title Internal command used for replication
#'@export
redisSYNC <- function(Rc) {
	cmd <- sprintf("SYNC ")
	redisCommand(cmd, Rc)
}
