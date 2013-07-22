#'@title Asynchronously rewrite the append-only file
#'@export
redisBGREWRITEAOF <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BGREWRITEAOF"
	redisCommand(Rc, cmd)
}
