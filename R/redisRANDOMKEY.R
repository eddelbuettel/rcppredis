#'@title Return a random key from the keyspace
#'@export
redisRANDOMKEY <- function(Rc) {
	cmd <- sprintf("RANDOMKEY ")
	redisCommand(cmd, Rc)
}
