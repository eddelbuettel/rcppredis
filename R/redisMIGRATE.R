#'@title Atomically transfer a key from a Redis instance to another one.
#'@export
redisMIGRATE <- function( host,  port,  key,  destination, Rc) {
	cmd <- sprintf("MIGRATE %s %s %s %s", host, port, key, destination)
	redisCommand(cmd, Rc)
}
