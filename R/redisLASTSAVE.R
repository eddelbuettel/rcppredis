#'@title Get the UNIX time stamp of the last successful save to disk
#'@export
redisLASTSAVE <- function(Rc) {
	cmd <- sprintf("LASTSAVE ")
	redisCommand(cmd, Rc)
}
