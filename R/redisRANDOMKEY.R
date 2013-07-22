#'@title Return a random key from the keyspace
#'@export
redisRANDOMKEY <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RANDOMKEY"
	redisCommand(Rc, cmd)
}
