#'@title Create a key using the provided serialized value, previously obtained using DUMP.
#'@export
redisRESTORE <- function( key,  ttl,  serialized, Rc) {
	cmd <- "RESTORE"
	redisCommand(Rc, cmd, list(key, ttl, serialized))
}
