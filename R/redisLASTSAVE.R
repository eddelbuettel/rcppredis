#'@title Get the UNIX time stamp of the last successful save to disk
#'@export
redisLASTSAVE <- function(Rc) {
	cmd <- "LASTSAVE"
	redisCommand(Rc, cmd)
}
