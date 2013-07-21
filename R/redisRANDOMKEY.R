#'@title Return a random key from the keyspace
#'@export
redisRANDOMKEY <- function(Rc) {
	cmd <- "RANDOMKEY"
	redisCommand(Rc, cmd)
}
