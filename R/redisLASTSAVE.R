#'@title Get the UNIX time stamp of the last successful save to disk
#'@export
redisLASTSAVE <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LASTSAVE"
	redisCommand(Rc, cmd)
}
