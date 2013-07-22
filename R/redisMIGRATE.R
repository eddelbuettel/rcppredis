#'@title Atomically transfer a key from a Redis instance to another one.
#'@export
redisMIGRATE <- function( host,  port,  key,  destination, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MIGRATE"
	redisCommand(Rc, cmd, list(host, port, key, destination))
}
